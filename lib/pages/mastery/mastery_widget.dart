import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mastery_model.dart';
export 'mastery_model.dart';

class MasteryWidget extends StatefulWidget {
  const MasteryWidget({super.key});

  static String routeName = 'Mastery';
  static String routePath = '/mastery';

  @override
  State<MasteryWidget> createState() => _MasteryWidgetState();
}

class _MasteryWidgetState extends State<MasteryWidget> {
  late MasteryModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MasteryModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid ?? '';

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        bottomNavigationBar: BottomNav2Widget(
  selectedIndex: 3,
),
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              );
            }

            final userData = snapshot.data?.data() as Map<String, dynamic>? ?? {};
            final masteryBadges = (userData['masteryBadges'] as List<dynamic>?) ?? [];
            final challengesCompleted = userData['challengesCompleted'] ?? 0;
            final expertTipsRead = userData['expertTipsRead'] ?? 0;
            final caseStudiesCompleted = userData['caseStudiesCompleted'] ?? 0;
            final advancedTheoryLevel = userData['advancedTheoryLevel'] ?? 0;

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Header
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 48.0, 24.0, 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '마스터리',
                            style: FlutterFlowTheme.of(context).headlineLarge.override(
                                  font: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '사주의 고급 이론과 실전 분석을 마스터하세요',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(),
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        // 성과 요약
                        _buildAchievementSummary(
                          context,
                          masteryBadges.length,
                          challengesCompleted,
                          expertTipsRead,
                          caseStudiesCompleted,
                        ),
                        const SizedBox(height: 24.0),

                        // 탭 바
                        _buildTabBar(context),
                        const SizedBox(height: 24.0),

                        // 탭 콘텐츠
                        if (_selectedTabIndex == 0)
                          _buildAdvancedTheorySection(context, advancedTheoryLevel)
                        else if (_selectedTabIndex == 1)
                          _buildChallengeQuestionsSection(context, challengesCompleted)
                        else if (_selectedTabIndex == 2)
                          _buildCaseStudiesSection(context, caseStudiesCompleted)
                        else if (_selectedTabIndex == 3)
                          _buildExpertTipsSection(context, expertTipsRead)
                        else if (_selectedTabIndex == 4)
                          _buildMasteryBadgesSection(context, masteryBadges)
                        else if (_selectedTabIndex == 5)
                          _buildPracticalAnalysisSection(context),

                        const SizedBox(height: 100.0),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAchievementSummary(
    BuildContext context,
    int badges,
    int challenges,
    int tips,
    int cases,
  ) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: FlutterFlowTheme.of(context).alternate, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🏆 마스터리 성과',
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem('⭐', '$badges', '획득 배지'),
              _buildStatItem('🎯', '$challenges', '도전 완료'),
              _buildStatItem('📚', '$tips', '팁 읽음'),
              _buildStatItem('👥', '$cases', '케이스'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String emoji, String count, String label) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 28.0)),
        const SizedBox(height: 4.0),
        Text(
          count,
          style: FlutterFlowTheme.of(context).headlineSmall?.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                color: FlutterFlowTheme.of(context).primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          label,
          style: FlutterFlowTheme.of(context).labelSmall.override(
                font: GoogleFonts.inter(),
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
        ),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    final tabs = ['심화이론', '도전문제', '케이스', '전문팁', '배지', '실전분석'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = _selectedTabIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: isSelected
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: isSelected
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                ),
                child: Text(
                  tabs[index],
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                        color: isSelected ? Colors.white : FlutterFlowTheme.of(context).primaryText,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildAdvancedTheorySection(BuildContext context, int level) {
    final theories = [
      {'title': '십성의 심화 이론', 'level': 1, 'description': '십성의 복합적 상호작용'},
      {'title': '합충형해파의 원리', 'level': 2, 'description': '더 깊은 분석 방법'},
      {'title': '납음오행과 신살', 'level': 3, 'description': '고급 사주 해석 기법'},
      {'title': '사주의 응용과 예측', 'level': 4, 'description': '미래 예측 방법론'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📖 심화 이론 학습',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                color: FlutterFlowTheme.of(context).primaryText,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12.0),
        Column(
          children: List.generate(theories.length, (index) {
            final theory = theories[index];
            final isUnlocked = level >= theory['level'];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: isUnlocked
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).alternate,
                    width: 1.0,
                  ),
                  opacity: isUnlocked ? 1.0 : 0.6,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                theory['title'],
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(width: 8.0),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  'Lv.${theory['level']}',
                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                        font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                        color: FlutterFlowTheme.of(context).primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            theory['description'],
                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                  font: GoogleFonts.inter(),
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      isUnlocked ? Icons.check_circle : Icons.lock,
                      color: isUnlocked
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildChallengeQuestionsSection(BuildContext context, int completed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '🎯 도전 문제',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                color: FlutterFlowTheme.of(context).primaryText,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12.0),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: FlutterFlowTheme.of(context).alternate, width: 1.0),
          ),
          child: Column(
            children: [
              Text(
                '완료한 도전: $completed / 50',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(),
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
              ),
              const SizedBox(height: 12.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: LinearProgressIndicator(
                  value: completed / 50,
                  minHeight: 12.0,
                  backgroundColor: FlutterFlowTheme.of(context).alternate,
                  valueColor: AlwaysStoppedAnimation(FlutterFlowTheme.of(context).primary),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('도전 문제를 풀기 시작하세요!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    '도전 시작',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCaseStudiesSection(BuildContext context, int completed) {
    final cases = [
      '유명인 A의 사주 분석',
      '유명인 B의 사주 분석',
      '유명인 C의 사주 분석',
      '특수 사주 케이스 1',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '👥 케이스 스터디',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                color: FlutterFlowTheme.of(context).primaryText,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12.0),
        Column(
          children: List.generate(cases.length, (index) {
            final isCompleted = index < completed;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: FlutterFlowTheme.of(context).alternate, width: 1.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        cases[index],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(),
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ),
                    Icon(
                      isCompleted ? Icons.check_circle : Icons.play_circle_outline,
                      color: isCompleted
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildExpertTipsSection(BuildContext context, int tipsRead) {
    final tips = [
      '사주 분석의 황금 규칙 5가지',
      '십성 조합으로 성격 파악하기',
      '대운과 세운의 활용법',
      '길한 날과 흉한 날 구분하기',
      '결혼, 사업, 건강 판단의 노하우',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '🎯 전문가 팁',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                color: FlutterFlowTheme.of(context).primaryText,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12.0),
        Text(
          '읽은 팁: $tipsRead / ${tips.length}',
          style: FlutterFlowTheme.of(context).labelSmall.override(
                font: GoogleFonts.inter(),
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
        ),
        const SizedBox(height: 12.0),
        Column(
          children: List.generate(tips.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: FlutterFlowTheme.of(context).alternate, width: 1.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            tips[index],
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Icon(
                          index < tipsRead ? Icons.check : Icons.arrow_forward,
                          color: index < tipsRead
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildMasteryBadgesSection(BuildContext context, List<dynamic> badges) {
    final allBadges = [
      {'name': '첫 도전', 'icon': '🎯', 'description': '도전 문제 1개 완료'},
      {'name': '심화 학자', 'icon': '📚', 'description': '심화 이론 레벨 2 도달'},
      {'name': '사주 마스터', 'icon': '👑', 'description': '도전 문제 50개 완료'},
      {'name': '케이스 전문가', 'icon': '👥', 'description': '케이스 스터디 4개 완료'},
      {'name': '팁 수집가', 'icon': '💡', 'description': '전문가 팁 5개 읽기'},
      {'name': '시간의 유행사', 'icon': '⏰', 'description': '30일 연속 학습'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '⭐ 마스터리 배지 (${badges.length}/${allBadges.length})',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                color: FlutterFlowTheme.of(context).primaryText,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12.0),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: allBadges.length,
          itemBuilder: (context, index) {
            final badge = allBadges[index];
            final isEarned = index < badges.length;
            return Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: isEarned
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).alternate,
                  width: 1.0,
                ),
                opacity: isEarned ? 1.0 : 0.5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    badge['icon'],
                    style: const TextStyle(fontSize: 32.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    badge['name'],
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPracticalAnalysisSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '🎓 실전 사주 분석',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                color: FlutterFlowTheme.of(context).primaryText,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12.0),
        _buildPracticalModeCard(
          context,
          '내 사주 분석하기',
          '당신의 사주를 직접 분석해보세요',
          '📋',
          () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('사주 입력 기능 준비 중입니다.')),
            );
          },
        ),
        const SizedBox(height: 12.0),
        _buildPracticalModeCard(
          context,
          '타인 사주 분석',
          '가족, 친구의 사주를 분석해보세요',
          '👨‍👩‍👧‍👦',
          () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('사주 입력 기능 준비 중입니다.')),
            );
          },
        ),
        const SizedBox(height: 12.0),
        _buildPracticalModeCard(
          context,
          '궁합 분석',
          '두 사주의 궁합도를 분석해보세요',
          '💕',
          () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('궁합 분석 기능 준비 중입니다.')),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPracticalModeCard(
    BuildContext context,
    String title,
    String description,
    String emoji,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: FlutterFlowTheme.of(context).alternate, width: 1.0),
        ),
        child: Row(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 32.0)),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    description,
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.inter(),
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: FlutterFlowTheme.of(context).primary,
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
