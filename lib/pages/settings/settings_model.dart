import '/components/button/button_widget.dart';
import '/components/reminder_card/reminder_card_widget.dart';
import '/components/setting_row/setting_row_widget.dart';
import '/components/switch_component/switch_component_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  Local state fields for this page.

  String? draftReminderTime;

  bool? isPickingTime = false;

  ///  State fields for stateful widgets in this page.

  // Model for SettingRow.
  late SettingRowModel settingRowModel1;
  // Model for SettingRow.
  late SettingRowModel settingRowModel2;
  // Model for SettingRow.
  late SettingRowModel settingRowModel3;
  // Models for ReminderCard.
  late FlutterFlowDynamicModels<ReminderCardModel> reminderCardModels;
  // Model for TextField.
  late TextFieldModel textFieldModel;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;
  // Model for Switch.
  late SwitchComponentModel switchModel1;
  // Model for Switch.
  late SwitchComponentModel switchModel2;
  // Model for SettingRow.
  late SettingRowModel settingRowModel4;

  @override
  void initState(BuildContext context) {
    settingRowModel1 = createModel(context, () => SettingRowModel());
    settingRowModel2 = createModel(context, () => SettingRowModel());
    settingRowModel3 = createModel(context, () => SettingRowModel());
    reminderCardModels = FlutterFlowDynamicModels(() => ReminderCardModel());
    textFieldModel = createModel(context, () => TextFieldModel());
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    switchModel1 = createModel(context, () => SwitchComponentModel());
    switchModel2 = createModel(context, () => SwitchComponentModel());
    settingRowModel4 = createModel(context, () => SettingRowModel());
  }

  @override
  void dispose() {
    settingRowModel1.dispose();
    settingRowModel2.dispose();
    settingRowModel3.dispose();
    reminderCardModels.dispose();
    textFieldModel.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
    switchModel1.dispose();
    switchModel2.dispose();
    settingRowModel4.dispose();
  }
}
