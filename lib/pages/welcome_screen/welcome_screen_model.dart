import '/components/button/button_widget.dart';
import '/components/feature_item/feature_item_widget.dart';
import '/components/motif_divider/motif_divider_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'welcome_screen_widget.dart' show WelcomeScreenWidget;
import 'package:flutter/material.dart';

class WelcomeScreenModel extends FlutterFlowModel<WelcomeScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MotifDivider.
  late MotifDividerModel motifDividerModel;
  // Model for FeatureItem.
  late FeatureItemModel featureItemModel1;
  // Model for FeatureItem.
  late FeatureItemModel featureItemModel2;
  // Model for FeatureItem.
  late FeatureItemModel featureItemModel3;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    motifDividerModel = createModel(context, () => MotifDividerModel());
    featureItemModel1 = createModel(context, () => FeatureItemModel());
    featureItemModel2 = createModel(context, () => FeatureItemModel());
    featureItemModel3 = createModel(context, () => FeatureItemModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    motifDividerModel.dispose();
    featureItemModel1.dispose();
    featureItemModel2.dispose();
    featureItemModel3.dispose();
    buttonModel.dispose();
  }
}
