import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'practice_model.dart';
export 'practice_model.dart';

class PracticeWidget extends StatefulWidget {
  const PracticeWidget({super.key});

  static String routeName = 'Practice';
  static String routePath = '/practice';

  @override
  State<PracticeWidget> createState() => _PracticeWidgetState();
}

class _PracticeWidgetState extends State<PracticeWidget> {
  late PracticeModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PracticeModel());
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
            final reviewStats = userData['reviewStats'] as Map<String, dynamic>? ?? {};
            final todayReviewCount = reviewStats['todayReviewCount'] ?? 0;
            final categoryAccuracy = userData['categoryAccuracy'] as Map<String, dynamic>? ?? {};

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
                            '복습하기',
                            style: FlutterFlowTheme.of(context).headlineLarge.override(
                                  font: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '틀린 문제와 약한 영역을 집중적으로 복습하세요',
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
                        // 복습 통계
                        _buildReviewStatsSection(context, todayReviewCount),
                        const SizedBox(height: 24.0),

                        // 탭 바
                        _buildTabBar(context),
                        const SizedBox(height: 24.0),

                        // 탭 콘텐츠
                        if (_selectedTabIndex == 0)
                          _buildWrongQuestionsSection(context, userId)
                        else if (_selectedTabIndex == 1)
                          _buildWeakCategoriesSection(context, categoryAccuracy)
                        else if (_selectedTabIndex == 2)
                          _buildBookmarkedQuestionsSection(context, userId)
                        else if (_selectedTabIndex == 3)
                          _buildReviewModesSection(context),

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

  Widget _buildReviewStatsSection(BuildContext context, int todayCount) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: FlutterFlowTheme.of(context).alternate, width: 1.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                '📚',
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              const SizedBox(height: 8.0),
              Text(
                '$todayCount',
                style: FlutterFlowTheme.of(context).headlineSmall?.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                      color: FlutterFlowTheme.of(context).primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '오늘 복습한 문제',
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.inter(),
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ],
          ),
          Container(
            width: 1.0,
            height: 60.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
          Column(
            children: [
              Text(
                '✨',
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              const SizedBox(height: 8.0),
              Text(
                '더 공부하기',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      font: GoogleFonts.inter(),
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
              Text(
                '약한 영역 집중학습',
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.inter(),
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    final tabs = ['틀린 문제', '약한 카테고리', '즐겨찾기', '복습 모드'];

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
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
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
                  style: FlutterFlowTheme.of(context).bodySmall.override(
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

  Widget _buildWrongQuestionsSection(BuildContext context, String userId) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '최근 틀린 문제',
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
          child: Center(
            child: Text(
              '아직 틀린 문제가 없습니다.\n문제를 풀고 복습을 시작하세요!',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(),
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
            ),
          ),
        ),
        const SizedBox(height: 12.0),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.goNamed(LearningPathWidget.routeName);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
            child: Text(
              '학습 시작하기',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWeakCategoriesSection(BuildContext context, Map<String, dynamic> categoryAccuracy) {
    final categories = ['음양', '오행', '천간', '지지', '십이운성', '합충형해파', '지장간', '십성', '납음오행', '신살'];
    
    final sortedCategories = categories.map((cat) {
      return {'name': cat, 'accuracy': (categoryAccuracy[cat] ?? 0).toInt()};
    }).toList();
    
    sortedCategories.sort((a, b) => a['accuracy'].compareTo(b['accuracy']));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '정답률 낮은 카테고리 TOP 5',
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
            children: List.generate(
              (sortedCategories.length > 5 ? 5 : sortedCategories.length),
              (index) {
                final category = sortedCategories[index];
                return Column(
                  children: [
                    if (index > 0)
                      Divider(color: FlutterFlowTheme.of(context).alternate),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${index + 1}. ${category['name']}',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(),
                                  color: FlutterFlowTheme.of(context).primaryText,
                                ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: category['accuracy'] < 70
                                  ? Colors.red.withOpacity(0.1)
                                  : Colors.yellow.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Text(
                              '${category['accuracy']}%',
                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                    font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                    color: category['accuracy'] < 70 ? Colors.red : Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBookmarkedQuestionsSection(BuildContext context, String userId) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '⭐ 즐겨찾기한 문제',
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
          child: Center(
            child: Text(
              '즐겨찾기한 문제가 없습니다.\n문제 풀이 중에 별 아이콘을 눌러 즐겨찾기하세요!',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(),
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewModesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '🎯 복습 모드 선택',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                color: FlutterFlowTheme.of(context).primaryText,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12.0),
        _buildReviewModeCard(
          context,
          '🔀 랜덤 복습',
          '임의의 카테고리에서 무작위로 문제를 풀어보세요',
          () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('랜덤 복습 준비 중입니다.')),
            );
          },
        ),
        const SizedBox(height: 12.0),
        _buildReviewModeCard(
          context,
          '📚 카테고리별 복습',
          '약한 카테고리를 집중적으로 복습하세요',
          () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('카테고리 선택 창이 열립니다.')),
            );
          },
        ),
        const SizedBox(height: 12.0),
        _buildReviewModeCard(
          context,
          '⏱️ 시간 제한 모드',
          '일정 시간 내에 몇 개를 풀 수 있을지 도전해보세요',
          () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('시간 제한 모드 준비 중입니다.')),
            );
          },
        ),
      ],
    );
  }

  Widget _buildReviewModeCard(
    BuildContext context,
    String title,
    String description,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    font: GoogleFonts.inter(),
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
