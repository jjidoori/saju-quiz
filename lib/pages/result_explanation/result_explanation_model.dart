import '/components/accordion/accordion_widget.dart';
import '/components/button/button_widget.dart';
import '/components/saju_pillar/saju_pillar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'result_explanation_widget.dart' show ResultExplanationWidget;
import 'package:flutter/material.dart';

class ResultExplanationModel extends FlutterFlowModel<ResultExplanationWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SajuPillar.
  late SajuPillarModel sajuPillarModel1;
  // Model for SajuPillar.
  late SajuPillarModel sajuPillarModel2;
  // Model for SajuPillar.
  late SajuPillarModel sajuPillarModel3;
  // Model for SajuPillar.
  late SajuPillarModel sajuPillarModel4;
  // Model for Accordion.
  late AccordionModel accordionModel;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    sajuPillarModel1 = createModel(context, () => SajuPillarModel());
    sajuPillarModel2 = createModel(context, () => SajuPillarModel());
    sajuPillarModel3 = createModel(context, () => SajuPillarModel());
    sajuPillarModel4 = createModel(context, () => SajuPillarModel());
    accordionModel = createModel(context, () => AccordionModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    sajuPillarModel1.dispose();
    sajuPillarModel2.dispose();
    sajuPillarModel3.dispose();
    sajuPillarModel4.dispose();
    accordionModel.dispose();
    buttonModel.dispose();
  }
}
