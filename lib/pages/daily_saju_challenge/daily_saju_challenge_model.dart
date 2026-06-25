import '/backend/backend.dart';
import '/components/button/button_widget.dart';
import '/components/reminder_card/reminder_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'daily_saju_challenge_widget.dart' show DailySajuChallengeWidget;
import 'package:flutter/material.dart';

class DailySajuChallengeModel
    extends FlutterFlowModel<DailySajuChallengeWidget> {
  ///  Local state fields for this page.

  int? selectedIndex = 2;

  int? correctIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in DailySajuChallenge widget.
  List<DailyChallengeRecord>? dailyQuestions;
  // Model for ReminderCard component.
  late ReminderCardModel reminderCardModel;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    reminderCardModel = createModel(context, () => ReminderCardModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    reminderCardModel.dispose();
    buttonModel.dispose();
  }
}
