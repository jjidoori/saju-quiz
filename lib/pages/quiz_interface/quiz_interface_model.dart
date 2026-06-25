import '/components/button/button_widget.dart';
import '/components/element_chip/element_chip_widget.dart';
import '/components/progress_dot/progress_dot_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'quiz_interface_widget.dart' show QuizInterfaceWidget;
import 'package:flutter/material.dart';

class QuizInterfaceModel extends FlutterFlowModel<QuizInterfaceWidget> {
  ///  Local state fields for this page.

  int? selectedIndex = -1;

  bool? isSubmitted = false;

  int? jihye = 0;

  int? correctIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for ProgressDot.
  late ProgressDotModel progressDotModel1;
  // Model for ProgressDot.
  late ProgressDotModel progressDotModel2;
  // Model for ProgressDot.
  late ProgressDotModel progressDotModel3;
  // Model for ProgressDot.
  late ProgressDotModel progressDotModel4;
  // Model for ProgressDot.
  late ProgressDotModel progressDotModel5;
  // Model for ElementChip.
  late ElementChipModel elementChipModel1;
  // Model for ElementChip.
  late ElementChipModel elementChipModel2;
  // Model for ElementChip.
  late ElementChipModel elementChipModel3;
  // Model for ElementChip.
  late ElementChipModel elementChipModel4;
  // Model for ElementChip.
  late ElementChipModel elementChipModel5;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    progressDotModel1 = createModel(context, () => ProgressDotModel());
    progressDotModel2 = createModel(context, () => ProgressDotModel());
    progressDotModel3 = createModel(context, () => ProgressDotModel());
    progressDotModel4 = createModel(context, () => ProgressDotModel());
    progressDotModel5 = createModel(context, () => ProgressDotModel());
    elementChipModel1 = createModel(context, () => ElementChipModel());
    elementChipModel2 = createModel(context, () => ElementChipModel());
    elementChipModel3 = createModel(context, () => ElementChipModel());
    elementChipModel4 = createModel(context, () => ElementChipModel());
    elementChipModel5 = createModel(context, () => ElementChipModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    progressDotModel1.dispose();
    progressDotModel2.dispose();
    progressDotModel3.dispose();
    progressDotModel4.dispose();
    progressDotModel5.dispose();
    elementChipModel1.dispose();
    elementChipModel2.dispose();
    elementChipModel3.dispose();
    elementChipModel4.dispose();
    elementChipModel5.dispose();
    buttonModel.dispose();
  }
}
