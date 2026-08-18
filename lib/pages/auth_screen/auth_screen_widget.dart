import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _isLogin = true;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthScreenModel());
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _checkExistingLogin();
  }

  Future<void> _checkExistingLogin() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Future.delayed(const Duration(milliseconds: 500), () {
        context.goNamed(LearningPathWidget.routeName);
      });
    }
  }

  @override
  void dispose() {
    _model.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleEmailAuth() async {
    try {
      if (_isLogin) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      }
      if (mounted) {
        context.goNamed(LearningPathWidget.routeName);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('오류: $e')),
      );
    }
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      final GoogleAuthProvider googleAuth = GoogleAuthProvider();
      final userCredential = await FirebaseAuth.instance.signInWithPopup(googleAuth);
      if (userCredential.user != null) {
        if (mounted) {
          context.goNamed(LearningPathWidget.routeName);
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Google 로그인 실패: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60.0),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 100.0,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 40.0),
                  Text(
                    '사주 마스터',
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          font: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    '60갑자의 비밀을 배워보세요',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(),
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                  const SizedBox(height: 60.0),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: '이메일',
                            hintText: 'example@email.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: '비밀번호',
                            hintText: '6자 이상',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                          onPressed: _handleEmailAuth,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: FlutterFlowTheme.of(context).primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                              vertical: 16.0,
                            ),
                            minimumSize: const Size(double.infinity, 48.0),
                          ),
                          child: Text(
                            _isLogin ? '로그인' : '회원가입',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                          child: Text(
                            _isLogin ? '회원가입' : '로그인으로 돌아가기',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          '또는',
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton.icon(
                    onPressed: _handleGoogleSignIn,
                    icon: const Icon(Icons.login),
                    label: const Text('Google로 로그인'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                        vertical: 16.0,
                      ),
                      minimumSize: const Size(double.infinity, 48.0),
                    ),
                  ),
                  const SizedBox(height: 60.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
