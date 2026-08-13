import '/auth/firebase_auth/auth_util.dart';
import '/components/button/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_screen_model.dart';
export 'auth_screen_model.dart';

class AuthScreenWidget extends StatefulWidget {
  const AuthScreenWidget({super.key});

  static String routeName = 'AuthScreen';
  static String routePath = '/authScreen';

  @override
  State<AuthScreenWidget> createState() => _AuthScreenWidgetState();
}

class _AuthScreenWidgetState extends State<AuthScreenWidget> {
  late AuthScreenModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _submitEmailAuth() async {
    final email = _model.emailController?.text.trim() ?? '';
    final password = _model.passwordController?.text ?? '';

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('이메일과 비밀번호를 입력해주세요.')),
      );
      return;
    }

    safeSetState(() => _model.isLoading = true);

    final user = _model.isLoginMode
        ? await authManager.signInWithEmail(context, email, password)
        : await authManager.createAccountWithEmail(context, email, password);

    safeSetState(() => _model.isLoading = false);

    if (user == null || !context.mounted) return;

    context.goNamedAuth(
      LearningPathWidget.routeName,
      context.mounted,
    );
  }

  Future<void> _submitGoogleAuth() async {
    safeSetState(() => _model.isLoading = true);
    final user = await authManager.signInWithGoogle(context);
    safeSetState(() => _model.isLoading = false);

    if (user == null || !context.mounted) return;

    context.goNamedAuth(
      LearningPathWidget.routeName,
      context.mounted,
    );
  }

  Future<void> _continueAsGuest() async {
    safeSetState(() => _model.isLoading = true);
    final user = await authManager.signInAnonymously(context);
    safeSetState(() => _model.isLoading = false);

    if (user == null || !context.mounted) return;

    context.goNamedAuth(
      LearningPathWidget.routeName,
      context.mounted,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: theme.primaryBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 뒤로가기
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_rounded,
                          color: theme.primaryText),
                      onPressed: () => context.pop(),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 타이틀
                  Text(
                    _model.isLoginMode ? '로그인' : '회원가입',
                    style: theme.headlineMedium.override(
                      font: GoogleFonts.notoSansKr(fontWeight: FontWeight.bold),
                      color: theme.primaryText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _model.isLoginMode
                        ? '사주마스터에 오신 것을 환영합니다'
                        : '학습 기록을 안전하게 저장해보세요',
                    style: theme.bodyMedium.override(
                      font: GoogleFonts.notoSansKr(),
                      color: theme.secondaryText,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // 이메일 입력
                  Text('이메일',
                      style: theme.labelMedium.override(
                        font: GoogleFonts.notoSansKr(fontWeight: FontWeight.w600),
                        color: theme.primaryText,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _model.emailController,
                    focusNode: _model.emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'example@email.com',
                      hintStyle: TextStyle(color: theme.secondaryText),
                      filled: true,
                      fillColor: theme.secondaryBackground,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: theme.alternate),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: theme.alternate),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: theme.primary, width: 2),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                    style: theme.bodyMedium.override(
                      font: GoogleFonts.notoSansKr(),
                      color: theme.primaryText,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 비밀번호 입력
                  Text('비밀번호',
                      style: theme.labelMedium.override(
                        font: GoogleFonts.notoSansKr(fontWeight: FontWeight.w600),
                        color: theme.primaryText,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _model.passwordController,
                    focusNode: _model.passwordFocusNode,
                    obscureText: !_model.passwordVisible,
                    decoration: InputDecoration(
                      hintText: '••••••••',
                      hintStyle: TextStyle(color: theme.secondaryText),
                      filled: true,
                      fillColor: theme.secondaryBackground,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: theme.alternate),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: theme.alternate),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: theme.primary, width: 2),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _model.passwordVisible
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          color: theme.secondaryText,
                          size: 20,
                        ),
                        onPressed: () => safeSetState(
                            () => _model.passwordVisible = !_model.passwordVisible),
                      ),
                    ),
                    style: theme.bodyMedium.override(
                      font: GoogleFonts.notoSansKr(),
                      color: theme.primaryText,
                    ),
                  ),

                  if (_model.isLoginMode) ...[
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () async {
                          final email = _model.emailController?.text.trim() ?? '';
                          if (email.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('먼저 이메일을 입력해주세요.')),
                            );
                            return;
                          }
                          await authManager.resetPassword(
                              email: email, context: context);
                        },
                        child: Text(
                          '비밀번호를 잊으셨나요?',
                          style: theme.labelSmall.override(
                            font: GoogleFonts.notoSansKr(),
                            color: theme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),

                  // 제출 버튼 (이메일 로그인/가입)
                  InkWell(
                    onTap: _model.isLoading ? null : _submitEmailAuth,
                    child: ButtonWidget(
                      iconPresent: false,
                      iconEndPresent: false,
                      content: _model.isLoginMode ? '로그인' : '회원가입',
                      variant: 'primary',
                      size: 'large',
                      fullWidth: true,
                      loading: _model.isLoading,
                      disabled: false,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 구분선
                  Row(
                    children: [
                      Expanded(child: Divider(color: theme.alternate)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text('또는',
                            style: theme.labelSmall
                                .override(font: GoogleFonts.notoSansKr(), color: theme.secondaryText)),
                      ),
                      Expanded(child: Divider(color: theme.alternate)),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // 구글 로그인 버튼
                  InkWell(
                    onTap: _model.isLoading ? null : _submitGoogleAuth,
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: theme.secondaryBackground,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: theme.alternate),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.g_mobiledata_rounded,
                              color: theme.primaryText, size: 28),
                          const SizedBox(width: 4),
                          Text(
                            'Google로 계속하기',
                            style: theme.bodyMedium.override(
                              font: GoogleFonts.notoSansKr(fontWeight: FontWeight.w600),
                              color: theme.primaryText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 로그인/회원가입 모드 전환
                  Center(
                    child: TextButton(
                      onPressed: () =>
                          safeSetState(() => _model.isLoginMode = !_model.isLoginMode),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: _model.isLoginMode
                                  ? '아직 계정이 없으신가요? '
                                  : '이미 계정이 있으신가요? ',
                              style: theme.bodySmall.override(
                                font: GoogleFonts.notoSansKr(),
                                color: theme.secondaryText,
                              ),
                            ),
                            TextSpan(
                              text: _model.isLoginMode ? '회원가입' : '로그인',
                              style: theme.bodySmall.override(
                                font: GoogleFonts.notoSansKr(fontWeight: FontWeight.bold),
                                color: theme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // 게스트로 둘러보기
                  Center(
                    child: TextButton(
                      onPressed: _model.isLoading ? null : _continueAsGuest,
                      child: Text(
                        '게스트로 둘러보기',
                        style: theme.labelSmall.override(
                          font: GoogleFonts.notoSansKr(),
                          color: theme.secondaryText,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
