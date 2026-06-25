import '/components/achievement_badge/achievement_badge_widget.dart';
import '/components/button/button_widget.dart';
import '/components/master_card/master_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_profile_progress_widget.dart' show UserProfileProgressWidget;
import 'package:flutter/material.dart';

class UserProfileProgressModel
    extends FlutterFlowModel<UserProfileProgressWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MasterCard.
  late MasterCardModel masterCardModel1;
  // Model for MasterCard.
  late MasterCardModel masterCardModel2;
  // Model for MasterCard.
  late MasterCardModel masterCardModel3;
  // Model for MasterCard.
  late MasterCardModel masterCardModel4;
  // Model for AchievementBadge.
  late AchievementBadgeModel achievementBadgeModel1;
  // Model for AchievementBadge.
  late AchievementBadgeModel achievementBadgeModel2;
  // Model for AchievementBadge.
  late AchievementBadgeModel achievementBadgeModel3;
  // Model for AchievementBadge.
  late AchievementBadgeModel achievementBadgeModel4;
  // Model for AchievementBadge.
  late AchievementBadgeModel achievementBadgeModel5;
  // Model for AchievementBadge.
  late AchievementBadgeModel achievementBadgeModel6;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    masterCardModel1 = createModel(context, () => MasterCardModel());
    masterCardModel2 = createModel(context, () => MasterCardModel());
    masterCardModel3 = createModel(context, () => MasterCardModel());
    masterCardModel4 = createModel(context, () => MasterCardModel());
    achievementBadgeModel1 =
        createModel(context, () => AchievementBadgeModel());
    achievementBadgeModel2 =
        createModel(context, () => AchievementBadgeModel());
    achievementBadgeModel3 =
        createModel(context, () => AchievementBadgeModel());
    achievementBadgeModel4 =
        createModel(context, () => AchievementBadgeModel());
    achievementBadgeModel5 =
        createModel(context, () => AchievementBadgeModel());
    achievementBadgeModel6 =
        createModel(context, () => AchievementBadgeModel());
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    masterCardModel1.dispose();
    masterCardModel2.dispose();
    masterCardModel3.dispose();
    masterCardModel4.dispose();
    achievementBadgeModel1.dispose();
    achievementBadgeModel2.dispose();
    achievementBadgeModel3.dispose();
    achievementBadgeModel4.dispose();
    achievementBadgeModel5.dispose();
    achievementBadgeModel6.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
