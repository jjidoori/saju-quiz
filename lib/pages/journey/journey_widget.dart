import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'journey_model.dart';
export 'journey_model.dart';

class JourneyWidget extends StatefulWidget {
  const JourneyWidget({super.key});

  static String routeName = 'Journey';
  static String routePath = '/journey';

  @override
  State<JourneyWidget> createState() => _JourneyWidgetState();
}

class _JourneyWidgetState extends State<JourneyWidget> {
  late JourneyModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JourneyModel());
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
            final level = userData['level'] ?? 1;
            final experience = userData['experience'] ?? 0;
            final streak = userData['streak'] ?? 0;
            final maxStreak = userData['maxStreak'] ?? 0;
            final totalStagesCompleted = userData['totalStagesCompleted'] ?? 0;
            final totalStages = userData['totalStages'] ?? 112;
            final progressPercent = (totalStagesCompleted / totalStages * 100).toInt();

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
                            '나의 여정',
                            style: FlutterFlowTheme.of(context).headlineLarge.override(
                                  font: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '사주 마스터 학습을 계속 진행 중입니다',
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
                        // 전체 진행률
                        _buildProgressSection(context, progressPercent, totalStagesCompleted, totalStages),
                        const SizedBox(height: 24.0),

                        // 레벨 + 경험치
                        _buildLevelSection(context, level, experience),
                        const SizedBox(height: 24.0),

                        // 연속 학습 스트릭
                        _buildStreakSection(context, streak, maxStreak),
                        const SizedBox(height: 24.0),

                        // 학습 통계
                        _buildStatsSection(context, userId),
                        const SizedBox(height: 24.0),

                        // 최근 활동
                        _buildRecentActivitySection(context, userId),
                        const SizedBox(height: 24.0),

                        // 완료 체크리스트
                        _buildCategoryChecklistSection(context, userId),
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

  Widget _buildProgressSection(BuildContext context, int percent, int completed, int total) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '📊 전체 진행률',
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '$percent%',
                style: FlutterFlowTheme.of(context).headlineSmall?.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                      color: FlutterFlowTheme.of(context).primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: LinearProgressIndicator(
              value: percent / 100,
              minHeight: 12.0,
              backgroundColor: FlutterFlowTheme.of(context).alternate,
              valueColor: AlwaysStoppedAnimation(FlutterFlowTheme.of(context).primary),
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            '완료한 스테이지: $completed / $total',
            style: FlutterFlowTheme.of(context).labelSmall.override(
                  font: GoogleFonts.inter(),
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelSection(BuildContext context, int level, int experience) {
    final nextLevelExp = level * 100;
    final expPercent = (experience / nextLevelExp * 100).toInt();

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '🏆 현재 레벨',
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'Level $level',
                style: FlutterFlowTheme.of(context).headlineSmall?.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                      color: FlutterFlowTheme.of(context).primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: LinearProgressIndicator(
              value: expPercent / 100,
              minHeight: 12.0,
              backgroundColor: FlutterFlowTheme.of(context).alternate,
              valueColor: AlwaysStoppedAnimation(FlutterFlowTheme.of(context).primary),
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            '경험치: $experience / $nextLevelExp (다음 레벨까지 ${nextLevelExp - experience} 필요)',
            style: FlutterFlowTheme.of(context).labelSmall.override(
                  font: GoogleFonts.inter(),
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildStreakSection(BuildContext context, int streak, int maxStreak) {
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
                '🔥',
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              const SizedBox(height: 8.0),
              Text(
                '$streak일',
                style: FlutterFlowTheme.of(context).headlineSmall?.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                      color: FlutterFlowTheme.of(context).primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '현재 스트릭',
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.inter(),
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '⭐',
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              const SizedBox(height: 8.0),
              Text(
                '$maxStreak일',
                style: FlutterFlowTheme.of(context).headlineSmall?.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                      color: FlutterFlowTheme.of(context).primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '최고 스트릭',
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

  Widget _buildStatsSection(BuildContext context, String userId) {
    final categories = ['음양', '오행', '천간', '지지', '십이운성', '합충형해파', '지장간', '십성', '납음오행', '신살'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📈 카테고리별 통계',
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
            children: categories.asMap().entries.map((entry) {
              final index = entry.key;
              final category = entry.value;
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
                          category,
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(),
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                        Text(
                          '0/4 (0%)',
                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                font: GoogleFonts.inter(),
                                color: FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentActivitySection(BuildContext context, String userId) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📅 최근 활동',
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
              '아직 학습 기록이 없습니다.',
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

  Widget _buildCategoryChecklistSection(BuildContext context, String userId) {
    final categories = ['음양', '오행', '천간', '지지', '십이운성', '합충형해파', '지장간', '십성', '납음오행', '신살'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '✅ 완료 체크리스트',
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
            children: categories.asMap().entries.map((entry) {
              final index = entry.key;
              final category = entry.value;
              return Column(
                children: [
                  if (index > 0)
                    Divider(color: FlutterFlowTheme.of(context).alternate),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.radio_button_unchecked,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                        const SizedBox(width: 12.0),
                        Text(
                          category,
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(),
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
