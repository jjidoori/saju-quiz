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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthScreenModel());
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
    super.dispose();
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
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              ElevatedButton.icon(
                onPressed: () async {
                  final GoogleAuthProvider googleAuth = GoogleAuthProvider();
                  try {
                    final userCredential = await FirebaseAuth.instance.signInWithPopup(googleAuth);
                    if (userCredential.user != null) {
                      if (mounted) {
                        context.goNamed(LearningPathWidget.routeName);
                      }
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('로그인 실패: $e')),
                    );
                  }
                },
                icon: const Icon(Icons.login),
                label: const Text('Google로 로그인'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
