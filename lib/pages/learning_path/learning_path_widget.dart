import '/components/bottom_nav2/bottom_nav2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'learning_path_model.dart';
export 'learning_path_model.dart';

// ============================================================
// 데이터 모델
// ============================================================

/// 실제 퀴즈 한 판(=Firestore subCategory 하나)에 해당하는 최하위 단위.
class SubStage {
  final String subCategory; // Firestore의 subCategory 필드값과 정확히 일치해야 함
  final String title;
  final String subtitle;
  const SubStage(this.subCategory, this.title, this.subtitle);
}

/// 합충형해파, 십성처럼 "하위 주제가 여러 개"인 그룹의 하위 주제 하나.
/// (예: 십성 그룹 안의 '비견', 합충형해파 그룹 안의 '충')
class SubGroup {
  final String key;
  final String title;
  final List<SubStage> stages;
  const SubGroup({required this.key, required this.title, required this.stages});
}

/// Learning Path 화면 최상단에 나오는 10개 메뉴 항목.
class TopCategory {
  final String key;
  final String title;
  final String subtitle;
  final IconData icon;
  final List<SubStage>? stages; // 단순 카테고리(음양·오행·천간 등)일 때 사용
  final List<SubGroup>? subgroups; // 그룹 카테고리(합충형해파·십성)일 때 사용

  const TopCategory({
    required this.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.stages,
    this.subgroups,
  });

  bool get isGroup => subgroups != null;
}

// ============================================================
// 데이터 생성 헬퍼
// ============================================================

/// "카테고리명_기초/일반/심화/응용" 4단계를 기계적으로 생성.
/// (오늘 DB 정합성 검수를 통해 이 네이밍 규칙이 전체 카테고리에 일관되게
/// 적용되어 있음을 확인했음 — 신살_기초, 정재_일반, 충_심화 등)
List<SubStage> _defaultStages(String catName, {String? displayName}) {
  final name = displayName ?? catName;
  return [
    SubStage('${catName}_기초', '$name 기초', '$name의 기본 개념 익히기'),
    SubStage('${catName}_일반', '$name 일반', '$name의 원리와 활용'),
    SubStage('${catName}_심화', '$name 심화', '$name 심화 이론'),
    SubStage('${catName}_응용', '$name 응용', '실전 상담에서의 $name 활용'),
  ];
}

// 합충형해파 9개 소주제
final List<SubGroup> _hapChungSubgroups = [
  SubGroup(key: '충', title: '충 (沖)', stages: _defaultStages('충')),
  SubGroup(key: '형', title: '형 (刑)', stages: _defaultStages('형')),
  SubGroup(key: '파', title: '파 (破)', stages: _defaultStages('파')),
  SubGroup(key: '해', title: '해 (害)', stages: _defaultStages('해')),
  SubGroup(key: '천간합', title: '천간합', stages: _defaultStages('천간합')),
  SubGroup(key: '지지육합', title: '지지육합', stages: _defaultStages('지지육합')),
  SubGroup(key: '암합', title: '암합', stages: _defaultStages('암합')),
  SubGroup(key: '방합', title: '방합', stages: _defaultStages('방합')),
  SubGroup(key: '삼합', title: '삼합', stages: _defaultStages('삼합')),
];

// 십성 10개 소주제
final List<SubGroup> _sipseongSubgroups = [
  SubGroup(key: '비견', title: '비견 (比肩)', stages: _defaultStages('비견')),
  SubGroup(key: '겁재', title: '겁재 (劫財)', stages: _defaultStages('겁재')),
  SubGroup(key: '식신', title: '식신 (食神)', stages: _defaultStages('식신')),
  SubGroup(key: '상관', title: '상관 (傷官)', stages: _defaultStages('상관')),
  SubGroup(key: '정재', title: '정재 (正財)', stages: _defaultStages('정재')),
  SubGroup(key: '편재', title: '편재 (偏財)', stages: _defaultStages('편재')),
  SubGroup(key: '정관', title: '정관 (正官)', stages: _defaultStages('정관')),
  SubGroup(key: '편관', title: '편관 (偏官)', stages: _defaultStages('편관')),
  SubGroup(key: '정인', title: '정인 (正印)', stages: _defaultStages('정인')),
  SubGroup(key: '편인', title: '편인 (偏印)', stages: _defaultStages('편인')),
];

// 오행은 원래 코드에 있던 8단계 구성을 그대로 유지 (상생/상극/과다/부족 포함)
final List<SubStage> _ohangStages = [
  SubStage('오행_기초', '오행 기초', '목·화·토·금·수의 특성'),
  SubStage('오행_일반', '오행 일반', '오행의 기본 원리와 관계'),
  SubStage('상생', '오행 상생', '수생목·목생화·화생토·토생금·금생수'),
  SubStage('상극', '오행 상극', '목극토·토극수·수극화·화극금·금극목'),
  SubStage('과다', '오행 과다', '특정 오행이 지나치게 강할 때'),
  SubStage('부족', '오행 부족', '특정 오행이 부족할 때'),
  SubStage('오행_심화', '오행 심화', '오행의 심화 이론'),
  SubStage('오행_응용', '오행 응용', '실전 상담에서의 오행 활용'),
];

// ============================================================
// 최상위 10개 카테고리 정의
// ============================================================

final List<TopCategory> _topCategories = [
  TopCategory(
    key: '음양',
    title: '음양 (陰陽)',
    subtitle: '음과 양의 원리와 자연 현상',
    icon: Icons.brightness_4_rounded,
    stages: _defaultStages('음양'),
  ),
  TopCategory(
    key: '오행',
    title: '오행 (五行)',
    subtitle: '목·화·토·금·수의 상생과 상극',
    icon: Icons.local_fire_department_rounded,
    stages: _ohangStages,
  ),
  TopCategory(
    key: '천간',
    title: '천간 (天干)',
    subtitle: '갑·을·병·정·무·기·경·신·임·계',
    icon: Icons.wb_sunny_rounded,
    stages: _defaultStages('천간'),
  ),
  TopCategory(
    key: '지지',
    title: '지지 (地支)',
    subtitle: '자·축·인·묘·진·사·오·미·신·유·술·해',
    icon: Icons.pets_rounded,
    stages: _defaultStages('지지'),
  ),
  TopCategory(
    key: '십이운성',
    title: '십이운성 (十二運星)',
    subtitle: '장생·목욕·관대·건록·제왕·쇠·병·사·묘·절·태·양',
    icon: Icons.loop_rounded,
    stages: _defaultStages('십이운성'),
  ),
  TopCategory(
    key: '합충형해파',
    title: '합·충·형·해·파',
    subtitle: '천간합, 지지합, 충·형·해·파의 원리',
    icon: Icons.compare_arrows_rounded,
    subgroups: _hapChungSubgroups,
  ),
  TopCategory(
    key: '지장간',
    title: '지장간 (地藏干)',
    subtitle: '지지 속에 숨어있는 천간',
    icon: Icons.layers_rounded,
    stages: _defaultStages('지장간'),
  ),
  TopCategory(
    key: '십성',
    title: '십성 (十星)',
    subtitle: '비겁·식상·재성·관성·인성의 원리',
    icon: Icons.stars_rounded,
    subgroups: _sipseongSubgroups,
  ),
  TopCategory(
    key: '납음오행',
    title: '납음오행 (納音五行)',
    subtitle: '60갑자의 소리와 오행의 관계',
    icon: Icons.music_note_rounded,
    stages: _defaultStages('납음오행'),
  ),
  TopCategory(
    key: '신살',
    title: '신살 (神殺)',
    subtitle: '사주에서 길신과 흉살의 작용',
    icon: Icons.auto_awesome_rounded,
    stages: _defaultStages('신살'),
  ),
];

// ============================================================
// 전체 학습 순서 (완전 순차 잠금용)
// ============================================================

/// _topCategories를 순서대로 펼쳐서 전체 112개 subCategory를
/// 하나의 순서로 이어붙인 리스트. 이 순서대로 앞 단계를 다 끝내야
/// 다음 단계가 열리는 "완전 순차" 잠금에 사용된다.
List<String> _buildGlobalStageOrder() {
  final order = <String>[];
  for (final cat in _topCategories) {
    if (cat.isGroup) {
      for (final group in cat.subgroups!) {
        for (final stage in group.stages) {
          order.add(stage.subCategory);
        }
      }
    } else {
      for (final stage in cat.stages!) {
        order.add(stage.subCategory);
      }
    }
  }
  return order;
}

final List<String> _globalStageOrder = _buildGlobalStageOrder();

// ============================================================
// 위젯
// ============================================================

class LearningPathWidget extends StatefulWidget {
  const LearningPathWidget({super.key});

  static String routeName = 'LearningPath';
  static String routePath = '/learningPath';

  @override
  State<LearningPathWidget> createState() => _LearningPathWidgetState();
}

class _LearningPathWidgetState extends State<LearningPathWidget> {
  late LearningPathModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // 펼쳐진 아코디언들을 key로 관리 (카테고리 key 또는 'top__subgroup' 형태)
  final Set<String> _expandedKeys = {};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearningPathModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  void _toggleExpand(String key) {
    safeSetState(() {
      if (_expandedKeys.contains(key)) {
        _expandedKeys.remove(key);
      } else {
        _expandedKeys.add(key);
      }
    });
  }

  void _showLockedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('이전 단계를 먼저 완료해주세요!')),
    );
  }

  void _navigateToQuiz(String category, String subCategory) {
    final appState = FFAppState();
    appState.update(() {
      appState.todayQuestionIds = [];
    });
    context.pushNamed(
      DailySajuChallengeWidget.routeName,
      queryParameters: {
        'category': category,
        'subCategory': subCategory,
        'questionNumber': '1',
        'answeredCorrect': '0',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final appState = FFAppState();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildHeader(context, appState),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 24.0),
                      ..._topCategories.map((cat) => _buildTopCategory(context, appState, cat)),
                      const SizedBox(height: 100.0),
                    ],
                  ),
                ),
              ),
            ),
            wrapWithModel(
              model: _model.bottomNavModel,
              updateCallback: () => safeSetState(() {}),
              child: const BottomNav2Widget(),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- 헤더 (기존과 동일, 생략 없이 유지 원하면 원본 참고) ----------------
  Widget _buildHeader(BuildContext context, FFAppState appState) {
    return Container(
      decoration: BoxDecoration(color: FlutterFlowTheme.of(context).secondaryBackground),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 48.0, 24.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Saju Master Journey',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        lineHeight: 1.3,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Learning Path',
                      style: FlutterFlowTheme.of(context).headlineLarge.override(
                            font: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            lineHeight: 1.2,
                          ),
                    ),
                    InkWell(
                      onTap: () async {
                        context.goNamed(UserProfileProgressWidget.routeName);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary5,
                          borderRadius: BorderRadius.circular(9999.0),
                          border: Border.all(color: FlutterFlowTheme.of(context).primary20, width: 1.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(Icons.stars_rounded, color: FlutterFlowTheme.of(context).primary, size: 16.0),
                              Text(
                                'Level ${appState.userLevel}',
                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                      font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                      color: FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.2,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 4.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ].divide(const SizedBox(height: 8.0)),
            ),
          ),
          Container(height: 1.0, color: FlutterFlowTheme.of(context).alternate),
        ],
      ),
    );
  }

  // ---------------- 최상위 카테고리 카드 (음양, 오행, 합충형해파, 십성 ...) ----------------
  Widget _buildTopCategory(BuildContext context, FFAppState appState, TopCategory cat) {
    final expanded = _expandedKeys.contains(cat.key);

    // 그룹이 아닌 단순 카테고리는 "전체 완료" 여부를 4단계(또는 오행 8단계) 모두 완료로 판단
    final isFullyCompleted = cat.isGroup
        ? cat.subgroups!.every((g) => g.stages.every((s) => appState.isCategoryCompleted(s.subCategory)))
        : cat.stages!.every((s) => appState.isCategoryCompleted(s.subCategory));

    return Column(
      children: [
        InkWell(
          onTap: () => _toggleExpand(cat.key),
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: FlutterFlowTheme.of(context).alternate, width: 1.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 44.0,
                    height: 44.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary20,
                      borderRadius: BorderRadius.circular(9999.0),
                    ),
                    child: Icon(cat.icon, color: FlutterFlowTheme.of(context).primary, size: 20.0),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cat.title,
                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                lineHeight: 1.4,
                              ),
                        ),
                        Text(
                          cat.subtitle,
                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                font: GoogleFonts.inter(),
                                color: FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                lineHeight: 1.3,
                              ),
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ),
                  if (isFullyCompleted)
                    Icon(Icons.check_circle_rounded, color: FlutterFlowTheme.of(context).success, size: 20.0),
                  Icon(
                    expanded ? Icons.expand_less : Icons.expand_more,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (expanded)
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 4.0, bottom: 8.0),
            child: cat.isGroup
                ? _buildSubgroupList(context, appState, cat)
                : _buildStageList(context, appState, cat.key, cat.stages!),
          ),
      ],
    );
  }

  // ---------------- 그룹 카테고리의 소주제 리스트 (합충형해파 → 충/형/파.. , 십성 → 비견/겁재..) ----------------
  Widget _buildSubgroupList(BuildContext context, FFAppState appState, TopCategory cat) {
    return Column(
      children: cat.subgroups!.map((group) {
        final groupExpandKey = '${cat.key}__${group.key}';
        final groupExpanded = _expandedKeys.contains(groupExpandKey);
        final groupCompleted = group.stages.every((s) => appState.isCategoryCompleted(s.subCategory));

        return Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Column(
            children: [
              InkWell(
                onTap: () => _toggleExpand(groupExpandKey),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: FlutterFlowTheme.of(context).alternate, width: 1.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.folder_open_rounded, color: FlutterFlowTheme.of(context).primary, size: 18.0),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            group.title,
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        if (groupCompleted)
                          Icon(Icons.check_circle_rounded, color: FlutterFlowTheme.of(context).success, size: 18.0),
                        Icon(
                          groupExpanded ? Icons.expand_less : Icons.expand_more,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (groupExpanded)
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 4.0),
                  child: _buildStageList(context, appState, cat.key, group.stages),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ---------------- 실제 4단계(혹은 오행 8단계) 리스트 — 잠금 로직 적용 ----------------
  Widget _buildStageList(BuildContext context, FFAppState appState, String parentCategoryKey, List<SubStage> stages) {
    // ⚠️ 완전 순차 학습: 카테고리 안에서만 순서를 보는 게 아니라,
    // 전체 112개 학습 순서(_globalStageOrder) 기준으로 "바로 이전 단계"가
    // 끝났는지 확인한다. 즉 음양을 4단계 다 끝내야 오행_기초가 열리는 식.
    final stageOrder = _globalStageOrder;

    return Column(
      children: List.generate(stages.length, (j) {
        final stage = stages[j];
        final isCompleted = appState.isCategoryCompleted(stage.subCategory);
        final isUnlocked = appState.isStageUnlocked(stageOrder, stage.subCategory);

        return Column(
          children: [
            InkWell(
              onTap: () {
                if (!isUnlocked) {
                  _showLockedMessage();
                  return;
                }
                _navigateToQuiz(parentCategoryKey, stage.subCategory);
              },
              child: Opacity(
                // 잠긴 단계는 시각적으로 흐리게 표시
                opacity: isUnlocked ? 1.0 : 0.45,
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: FlutterFlowTheme.of(context).alternate, width: 1.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        Container(
                          width: 36.0,
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary20,
                            borderRadius: BorderRadius.circular(9999.0),
                          ),
                          child: Icon(
                            isUnlocked ? Icons.menu_book_rounded : Icons.lock_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 16.0,
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                stage.title,
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                stage.subtitle,
                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                      font: GoogleFonts.inter(),
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ].divide(const SizedBox(height: 2.0)),
                          ),
                        ),
                        if (isCompleted)
                          Icon(Icons.check_circle_rounded, color: FlutterFlowTheme.of(context).success, size: 20.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (j < stages.length - 1)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Container(width: 2.0, height: 16.0, color: FlutterFlowTheme.of(context).alternate),
              ),
          ],
        );
      }),
    );
  }
}
