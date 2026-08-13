import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'auth_screen_widget.dart' show AuthScreenWidget;
import 'package:flutter/material.dart';

class AuthScreenModel extends FlutterFlowModel<AuthScreenWidget> {
  /// 로그인 모드인지(true) 회원가입 모드인지(false) 토글
  bool isLoginMode = true;
  bool isLoading = false;
  bool passwordVisible = false;

  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;

  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  String? Function(BuildContext, String?)? passwordControllerValidator;

  @override
  void initState(BuildContext context) {
    emailController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordController = TextEditingController();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailController?.dispose();
    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }
}
