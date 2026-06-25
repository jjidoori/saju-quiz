import '/components/bottom_nav2/bottom_nav2_widget.dart';
import '/components/path_divider/path_divider_widget.dart';
import '/components/path_node/path_node_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'learning_path_widget.dart' show LearningPathWidget;
import 'package:flutter/material.dart';

class LearningPathModel extends FlutterFlowModel<LearningPathWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PathNode.
  late PathNodeModel pathNodeModel1;
  // Model for PathDivider.
  late PathDividerModel pathDividerModel1;
  // Model for PathNode.
  late PathNodeModel pathNodeModel2;
  // Model for PathDivider.
  late PathDividerModel pathDividerModel2;
  // Model for PathNode.
  late PathNodeModel pathNodeModel3;
  // Model for PathDivider.
  late PathDividerModel pathDividerModel3;
  // Model for PathNode.
  late PathNodeModel pathNodeModel4;
  // Model for PathDivider.
  late PathDividerModel pathDividerModel4;
  // Model for PathNode.
  late PathNodeModel pathNodeModel5;
  // Model for BottomNav.
  late BottomNav2Model bottomNavModel;

  @override
  void initState(BuildContext context) {
    pathNodeModel1 = createModel(context, () => PathNodeModel());
    pathDividerModel1 = createModel(context, () => PathDividerModel());
    pathNodeModel2 = createModel(context, () => PathNodeModel());
    pathDividerModel2 = createModel(context, () => PathDividerModel());
    pathNodeModel3 = createModel(context, () => PathNodeModel());
    pathDividerModel3 = createModel(context, () => PathDividerModel());
    pathNodeModel4 = createModel(context, () => PathNodeModel());
    pathDividerModel4 = createModel(context, () => PathDividerModel());
    pathNodeModel5 = createModel(context, () => PathNodeModel());
    bottomNavModel = createModel(context, () => BottomNav2Model());
  }

  @override
  void dispose() {
    pathNodeModel1.dispose();
    pathDividerModel1.dispose();
    pathNodeModel2.dispose();
    pathDividerModel2.dispose();
    pathNodeModel3.dispose();
    pathDividerModel3.dispose();
    pathNodeModel4.dispose();
    pathDividerModel4.dispose();
    pathNodeModel5.dispose();
    bottomNavModel.dispose();
  }
}
