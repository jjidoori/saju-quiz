import '/components/bottom_nav2/bottom_nav2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'learning_path_widget.dart' show LearningPathWidget;
import 'package:flutter/material.dart';

class LearningPathModel extends FlutterFlowModel<LearningPathWidget> {
  late BottomNav2Model bottomNavModel;

  @override
  void initState(BuildContext context) {
    bottomNavModel = createModel(context, () => BottomNav2Model());
  }

  @override
  void dispose() {
    bottomNavModel.dispose();
  }
}
