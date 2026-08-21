import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  static String routeName = 'Profile';
  static String routePath = '/profile';

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user?.uid ?? '';

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        bottomNavigationBar: BottomNav2Widget(
  selectedIndex: 4,
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
            final level = userData['level'] ?? 1;
            final totalStagesCompleted = userData['totalStagesCompleted'] ?? 0;
            final totalStages = userData['totalStages'] ?? 112;
            final progressPercent = (totalStagesCompleted / totalStages * 100).toInt();

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Header with user info
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 48.0, 24.0, 32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                child: Center(
                                  child: Text(
                                    '👤',
                                    style: FlutterFlowTheme.of(context).headlineLarge,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user?.email?.split('@')[0] ?? '사용자',
                                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                                            font: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      'Level $level',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(),
                                            color: FlutterFlowTheme.of(context).primary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24.0),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: LinearProgressIndicator(
                              value: progressPercent / 100,
                              minHeight: 12.0,
                              backgroundColor: FlutterFlowTheme.of(context).alternate,
                              valueColor: AlwaysStoppedAnimation(FlutterFlowTheme.of(context).primary),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '$progressPercent% 완료 ($totalStagesCompleted/$totalStages)',
                            style: FlutterFlowTheme.of(context).labelSmall.override(
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
                        // 계정 정보
                        _buildSectionTitle(context, '계정 정보'),
                        const SizedBox(height: 12.0),
                        _buildProfileSection(context, [
                          _buildProfileItem('📧', '이메일', user?.email ?? 'N/A', false),
                          _buildProfileItem('🔐', '계정 상태', '활성화', false),
                          _buildProfileItem('📱', 'Google 로그인', '연동됨', false),
                        ]),
                        const SizedBox(height: 24.0),

                        // 학습 설정
                        _buildSectionTitle(context, '학습 설정'),
                        const SizedBox(height: 12.0),
                        _buildSettingSection(context, [
                          _buildSettingItem(
                            '🔔',
                            '알림 설정',
                            '학습 리마인더 알림',
                            true,
                          ),
                          _buildSettingItem(
                            '🌙',
                            '어두운 테마',
                            '화면 밝기 자동 조절',
                            false,
                          ),
                          _buildSettingItem(
                            '🌐',
                            '언어 설정',
                            '한국어',
                            false,
                          ),
                        ]),
                        const SizedBox(height: 24.0),

                        // 통계 요약
                        _buildSectionTitle(context, '학습 통계'),
                        const SizedBox(height: 12.0),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(color: FlutterFlowTheme.of(context).alternate, width: 1.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildStatColumn('📚', '완료', '$totalStagesCompleted'),
                              Container(
                                width: 1.0,
                                height: 60.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              _buildStatColumn('⭐', '레벨', '$level'),
                              Container(
                                width: 1.0,
                                height: 60.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              _buildStatColumn('🔥', '진행률', '$progressPercent%'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24.0),

                        // 피드백 및 도움말
                        _buildSectionTitle(context, '피드백 및 도움말'),
                        const SizedBox(height: 12.0),
                        _buildActionSection(context, [
                          _buildActionItem('💬', '의견 보내기', 'feedback@sajumaster.com'),
                          _buildActionItem('❓', 'FAQ', 'https://sajumaster.co.kr/faq'),
                          _buildActionItem('📄', '이용약관', 'https://sajumaster.co.kr/terms'),
                          _buildActionItem('🔒', '개인정보 보호정책', 'https://sajumaster.co.kr/privacy'),
                        ]),
                        const SizedBox(height: 24.0),

                        // 버전 정보
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
                                '버전 정보',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                      color: FlutterFlowTheme.of(context).primaryText,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                '사주 마스터 v1.0.0',
                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                      font: GoogleFonts.inter(),
                                      color: FlutterFlowTheme.of(context).secondaryText,
                                    ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                '최신 버전입니다',
                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                      font: GoogleFonts.inter(),
                                      color: FlutterFlowTheme.of(context).primary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24.0),

                        // 로그아웃 버튼
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              _showLogoutDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                            ),
                            child: Text(
                              '로그아웃',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),

                        // 회원탈퇴 버튼
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              _showDeleteAccountDialog(context);
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                              side: const BorderSide(color: Colors.red),
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                            ),
                            child: Text(
                              '회원탈퇴',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
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

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: FlutterFlowTheme.of(context).bodyLarge.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.bold),
              color: FlutterFlowTheme.of(context).primaryText,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context, List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: FlutterFlowTheme.of(context).alternate, width: 1.0),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          return Column(
            children: [
              if (index > 0)
                Divider(
                  color: FlutterFlowTheme.of(context).alternate,
                  height: 0,
                ),
              items[index],
            ],
          );
        }),
      ),
    );
  }

  Widget _buildProfileItem(String icon, String label, String value, bool isCopyable) {
    return InkWell(
      onTap: isCopyable
          ? () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$value가 복사되었습니다')),
              );
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(icon, style: const TextStyle(fontSize: 20.0)),
                const SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            font: GoogleFonts.inter(),
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      value,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(),
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            if (isCopyable)
              Icon(
                Icons.copy,
                color: FlutterFlowTheme.of(context).secondary,
                size: 18.0,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingSection(BuildContext context, List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: FlutterFlowTheme.of(context).alternate, width: 1.0),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          return Column(
            children: [
              if (index > 0)
                Divider(
                  color: FlutterFlowTheme.of(context).alternate,
                  height: 0,
                ),
              items[index],
            ],
          );
        }),
      ),
    );
  }

  Widget _buildSettingItem(String icon, String title, String subtitle, bool isEnabled) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 20.0)),
              const SizedBox(width: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(),
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.inter(),
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                ],
              ),
            ],
          ),
          Switch(
            value: isEnabled,
            onChanged: (value) {},
            activeColor: FlutterFlowTheme.of(context).primary,
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String icon, String label, String value) {
    return Column(
      children: [
        Text(icon, style: const TextStyle(fontSize: 24.0)),
        const SizedBox(height: 8.0),
        Text(
          value,
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

  Widget _buildActionSection(BuildContext context, List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: FlutterFlowTheme.of(context).alternate, width: 1.0),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          return Column(
            children: [
              if (index > 0)
                Divider(
                  color: FlutterFlowTheme.of(context).alternate,
                  height: 0,
                ),
              items[index],
            ],
          );
        }),
      ),
    );
  }

  Widget _buildActionItem(String icon, String title, String value) {
    return InkWell(
      onTap: () async {
        if (value.startsWith('http')) {
          if (await canLaunchUrl(Uri.parse(value))) {
            await launchUrl(Uri.parse(value));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title: 준비 중입니다')),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(icon, style: const TextStyle(fontSize: 20.0)),
                const SizedBox(width: 12.0),
                Text(
                  title,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(),
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: FlutterFlowTheme.of(context).secondary,
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('로그아웃'),
          content: const Text('정말 로그아웃 하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                context.goNamed(AuthScreenWidget.routeName);
              },
              child: const Text('로그아웃', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('회원탈퇴'),
          content: const Text('정말 회원탈퇴 하시겠습니까?\n이 작업은 되돌릴 수 없습니다.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('회원탈퇴 기능은 준비 중입니다')),
                );
                Navigator.pop(context);
              },
              child: const Text('탈퇴', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
