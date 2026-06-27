import '/components/button/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'quiz_result_widget.dart' show QuizResultWidget;
import 'package:flutter/material.dart';

class QuizResultModel extends FlutterFlowModel<QuizResultWidget> {
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    buttonModel.dispose();
  }
}
