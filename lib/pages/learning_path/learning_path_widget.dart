import '/components/bottom_nav2/bottom_nav2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'learning_path_model.dart';
export 'learning_path_model.dart';

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
bool _ohangExpanded = false;
bool _eumyangExpanded = false;

  final List<Map<String, dynamic>> _eumyangSubcategories = [
{'subCategory': '음양_일반', 'title': '음양 일반', 'subtitle': '음과 양의 기초 개념과 자연 현상'},
    {'subCategory': '음양_심화', 'title': '음양 심화', 'subtitle': '사주·한의학·역학에 적용되는 음양 원리'},
  ];

  final List<Map<String, dynamic>> _categories = [
    {'category': '음양', 'title': '음양 (陰陽)', 'subtitle': '음과 양의 원리와 자연 현상', 'icon': Icons.brightness_4_rounded, 'hasSubcategories': true},
    {'category': '오행', 'title': '오행 (五行)', 'subtitle': '목·화·토·금·수의 상생과 상극', 'icon': Icons.local_fire_department_rounded, 'hasSubcategories': true},
    {'category': '천간', 'title': '천간 (天干)', 'subtitle': '갑·을·병·정·무·기·경·신·임·계', 'icon': Icons.wb_sunny_rounded},
    {'category': '지지', 'title': '지지 (地支)', 'subtitle': '자·축·인·묘·진·사·오·미·신·유·술·해', 'icon': Icons.pets_rounded},
    {'category': '십이운성', 'title': '십이운성 (十二運星)', 'subtitle': '장생·목욕·관대·건록·제왕·쇠·병·사·묘·절·태·양', 'icon': Icons.loop_rounded},
    {'category': '합/충/형/해/파', 'title': '합·충·형·해·파', 'subtitle': '천간합, 지지합, 충·형·해·파의 원리', 'icon': Icons.compare_arrows_rounded},
    {'category': '지장간', 'title': '지장간 (地藏干)', 'subtitle': '지지 속에 숨어있는 천간', 'icon': Icons.layers_rounded},
    {'category': '십성', 'title': '십성 (十星)', 'subtitle': '비겁·식상·재성·관성·인성의 원리', 'icon': Icons.stars_rounded},
   {'category': '납음오행', 'title': '납음오행 (納音五行)', 'subtitle': '60갑자의 소리와 오행의 관계', 'icon': Icons.music_note_rounded},
    {'category': '신살', 'title': '신살 (神殺)', 'subtitle': '사주에서 길신과 흉살의 작용', 'icon': Icons.auto_awesome_rounded},
  ];

  final List<Map<String, dynamic>> _ohangSubcategories = [
    {'subCategory': '오행기초', 'title': '오행 기초', 'subtitle': '목·화·토·금·수의 특성'},
    {'subCategory': '상생', 'title': '오행 상생', 'subtitle': '수생목·목생화·화생토·토생금·금생수'},
    {'subCategory': '상극', 'title': '오행 상극', 'subtitle': '목극토·토극수·수극화·화극금·금극목'},
    {'subCategory': '과다', 'title': '오행 과다', 'subtitle': '특정 오행이 지나치게 강할 때'},
    {'subCategory': '부족', 'title': '오행 부족', 'subtitle': '특정 오행이 부족할 때'},
  ];

  @override
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearningPathModel());
    _ohangExpanded = false;
    _eumyangExpanded = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    _model.dispose();
    super.dispose();
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
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 48.0, 24.0, 24.0),
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
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary20,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
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
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                  Container(height: 1.0, color: FlutterFlowTheme.of(context).alternate),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 24.0),
                      ...List.generate(_categories.length, (i) {
                        final cat = _categories[i];
                        final category = cat['category'] as String;
                        final isCompleted = appState.isCategoryCompleted(category);
                        final isUnlocked = appState.isCategoryUnlocked(category);
                        final isCurrent = isUnlocked && !isCompleted;
                        final hasSubcategories = cat['hasSubcategories'] == true;

                        return Column(
                          children: [
                            InkWell(
                          onTap: isUnlocked ? () {
                                if (hasSubcategories && category == '음양') {
                                  safeSetState(() {
                                    _eumyangExpanded = !_eumyangExpanded;
                                  });
                                } else if (hasSubcategories) {
                                  safeSetState(() {
                                    _ohangExpanded = !_ohangExpanded;
                                  });
                                } else {
                                  appState.update(() {
                                    appState.todayQuestionIds = [];
                                  });
                                  context.pushNamed(
                                    DailySajuChallengeWidget.routeName,
                                    queryParameters: {
                                      'category': category,
                                      'questionNumber': '1',
                                      'answeredCorrect': '0',
                                    },
                                  );
                                }
                              } : null,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isCurrent
                                      ? FlutterFlowTheme.of(context).primary5
                                      : FlutterFlowTheme.of(context).secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: isCurrent
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 44.0,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: isUnlocked
                                              ? FlutterFlowTheme.of(context).primary20
                                              : FlutterFlowTheme.of(context).alternate,
                                          borderRadius: BorderRadius.circular(9999.0),
                                        ),
                                        child: Icon(
                                          isUnlocked ? cat['icon'] as IconData : Icons.lock_rounded,
                                          color: isUnlocked
                                              ? FlutterFlowTheme.of(context).primary
                                              : FlutterFlowTheme.of(context).secondaryText,
                                          size: 20.0,
                                        ),
                                      ),
                                      SizedBox(width: 16.0),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cat['title'] as String,
                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                                color: isUnlocked
                                                    ? FlutterFlowTheme.of(context).primaryText
                                                    : FlutterFlowTheme.of(context).secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                lineHeight: 1.4,
                                              ),
                                            ),
                                            Text(
                                              cat['subtitle'] as String,
                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                font: GoogleFonts.inter(),
                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                letterSpacing: 0.0,
                                                lineHeight: 1.3,
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                  if (hasSubcategories && isUnlocked)
                                        Icon(
                                          (category == '음양' ? _eumyangExpanded : _ohangExpanded)
                                              ? Icons.expand_less
                                              : Icons.expand_more,
                                          color: FlutterFlowTheme.of(context).primary,
                                          size: 24.0,
                                        ),
                                      if (isCompleted && !hasSubcategories)
                                        Icon(Icons.check_circle_rounded,
                                            color: FlutterFlowTheme.of(context).success, size: 24.0),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (hasSubcategories && category == '음양' && _eumyangExpanded && isUnlocked)
                              Padding(
                                padding: EdgeInsets.only(left: 24.0, top: 4.0),
                                child: Column(
                                  children: List.generate(_eumyangSubcategories.length, (j) {
                                    final sub = _eumyangSubcategories[j];
                                    final subCategory = sub['subCategory'] as String;
                                    final isSubCompleted = appState.isCategoryCompleted(subCategory);
                                    bool isSubUnlocked;
                                    if (j == 0) {
                                      isSubUnlocked = true;
                                    } else {
                                      final prevSub = _eumyangSubcategories[j-1]['subCategory'] as String;
                                      isSubUnlocked = appState.isCategoryCompleted(prevSub);
                                    }
                                    return Column(
                                      children: [
                                        InkWell(
                                          onTap: isSubUnlocked ? () {
                                            appState.update(() {
                                              appState.todayQuestionIds = [];
                                            });
                                            context.pushNamed(
                                              DailySajuChallengeWidget.routeName,
                                              queryParameters: {
                                                'category': '음양',
                                                'subCategory': subCategory,
                                                'questionNumber': '1',
                                                'answeredCorrect': '0',
                                              },
                                            );
                                          } : null,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: isSubUnlocked && !isSubCompleted
                                                  ? FlutterFlowTheme.of(context).primary5
                                                  : FlutterFlowTheme.of(context).secondaryBackground,
                                              borderRadius: BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: isSubUnlocked && !isSubCompleted
                                                    ? FlutterFlowTheme.of(context).primary
                                                    : FlutterFlowTheme.of(context).alternate,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(14.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 36.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color: isSubUnlocked
                                                          ? FlutterFlowTheme.of(context).primary20
                                                          : FlutterFlowTheme.of(context).alternate,
                                                      borderRadius: BorderRadius.circular(9999.0),
                                                    ),
                                                    child: Icon(
                                                      isSubUnlocked ? Icons.menu_book_rounded : Icons.lock_rounded,
                                                      color: isSubUnlocked
                                                          ? FlutterFlowTheme.of(context).primary
                                                          : FlutterFlowTheme.of(context).secondaryText,
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                  SizedBox(width: 12.0),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          sub['title'] as String,
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                                            color: isSubUnlocked
                                                                ? FlutterFlowTheme.of(context).primaryText
                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          sub['subtitle'] as String,
                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                            font: GoogleFonts.inter(),
                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                            letterSpacing: 0.0,
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(height: 2.0)),
                                                    ),
                                                  ),
                                                  if (isSubCompleted)
                                                    Icon(Icons.check_circle_rounded,
                                                        color: FlutterFlowTheme.of(context).success, size: 20.0),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 6.0),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                            if (hasSubcategories && category == '오행' && _ohangExpanded && isUnlocked)
                              Padding(
                                padding: EdgeInsets.only(left: 24.0, top: 4.0),
                                child: Column(
                                  children: List.generate(_ohangSubcategories.length, (j) {
                                    final sub = _ohangSubcategories[j];
                                    final subCategory = sub['subCategory'] as String;
                                  final subKey = subCategory == '오행기초' ? '오행_오행기초' : '오행_$subCategory';
final isSubCompleted = appState.isCategoryCompleted(subKey);
                                  bool isSubUnlocked;
if (j == 0) {
  isSubUnlocked = true;
} else {
  final prevSub = _ohangSubcategories[j-1]['subCategory'] as String;
  final prevKey = prevSub == '오행기초' ? '오행_오행기초' : '오행_$prevSub';
  isSubUnlocked = appState.isCategoryCompleted(prevKey);
}

                                    return Column(
                                      children: [
                                        InkWell(
                                          onTap: isSubUnlocked ? () {
                                            appState.update(() {
                                              appState.todayQuestionIds = [];
                                            });
                                            context.pushNamed(
                                              DailySajuChallengeWidget.routeName,
                                              queryParameters: {
                                                'category': '오행',
                                                'subCategory': subCategory == '오행기초' ? null : subCategory,
                                                'questionNumber': '1',
                                                'answeredCorrect': '0',
                                              },
                                            );
                                          } : null,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: isSubUnlocked && !isSubCompleted
                                                  ? FlutterFlowTheme.of(context).primary5
                                                  : FlutterFlowTheme.of(context).secondaryBackground,
                                              borderRadius: BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: isSubUnlocked && !isSubCompleted
                                                    ? FlutterFlowTheme.of(context).primary
                                                    : FlutterFlowTheme.of(context).alternate,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(14.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 36.0,
                                                    height: 36.0,
                                                    decoration: BoxDecoration(
                                                      color: isSubUnlocked
                                                          ? FlutterFlowTheme.of(context).primary20
                                                          : FlutterFlowTheme.of(context).alternate,
                                                      borderRadius: BorderRadius.circular(9999.0),
                                                    ),
                                                    child: Icon(
                                                      isSubUnlocked ? Icons.menu_book_rounded : Icons.lock_rounded,
                                                      color: isSubUnlocked
                                                          ? FlutterFlowTheme.of(context).primary
                                                          : FlutterFlowTheme.of(context).secondaryText,
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                  SizedBox(width: 12.0),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          sub['title'] as String,
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                                            color: isSubUnlocked
                                                                ? FlutterFlowTheme.of(context).primaryText
                                                                : FlutterFlowTheme.of(context).secondaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          sub['subtitle'] as String,
                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                            font: GoogleFonts.inter(),
                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                            letterSpacing: 0.0,
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(height: 2.0)),
                                                    ),
                                                  ),
                                                  if (isSubCompleted)
                                                    Icon(Icons.check_circle_rounded,
                                                        color: FlutterFlowTheme.of(context).success, size: 20.0),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (j < _ohangSubcategories.length - 1)
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: 3.0),
                                            child: Container(
                                              width: 2.0,
                                              height: 16.0,
                                              color: FlutterFlowTheme.of(context).alternate,
                                            ),
                                          ),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                            if (i < _categories.length - 1)
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0),
                                child: Container(
                                  width: 2.0,
                                  height: 24.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                          ],
                        );
                      }),
                      SizedBox(height: 100.0),
                    ],
                  ),
                ),
              ),
            ),
            wrapWithModel(
              model: _model.bottomNavModel,
              updateCallback: () => safeSetState(() {}),
              child: BottomNav2Widget(),
            ),
          ],
        ),
      ),
    );
  }
}
