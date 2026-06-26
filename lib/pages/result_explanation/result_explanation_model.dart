import '/components/button/button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'result_explanation_widget.dart' show ResultExplanationWidget;
import 'package:flutter/material.dart';

class ResultExplanationModel extends FlutterFlowModel<ResultExplanationWidget> {
  // Model for Button.
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
