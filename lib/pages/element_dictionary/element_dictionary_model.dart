import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/dictionary_item/dictionary_item_widget.dart';
import '/components/element_category_card/element_category_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'element_dictionary_widget.dart' show ElementDictionaryWidget;
import 'package:flutter/material.dart';

class ElementDictionaryModel extends FlutterFlowModel<ElementDictionaryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ElementCategoryCard.
  late ElementCategoryCardModel elementCategoryCardModel1;
  // Model for ElementCategoryCard.
  late ElementCategoryCardModel elementCategoryCardModel2;
  // Model for ElementCategoryCard.
  late ElementCategoryCardModel elementCategoryCardModel3;
  // Model for ElementCategoryCard.
  late ElementCategoryCardModel elementCategoryCardModel4;
  // Model for ElementCategoryCard.
  late ElementCategoryCardModel elementCategoryCardModel5;
  // Model for DictionaryItem.
  late DictionaryItemModel dictionaryItemModel1;
  // Model for DictionaryItem.
  late DictionaryItemModel dictionaryItemModel2;
  // Model for DictionaryItem.
  late DictionaryItemModel dictionaryItemModel3;
  // Model for DictionaryItem.
  late DictionaryItemModel dictionaryItemModel4;
  // Model for BottomNav.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    elementCategoryCardModel1 =
        createModel(context, () => ElementCategoryCardModel());
    elementCategoryCardModel2 =
        createModel(context, () => ElementCategoryCardModel());
    elementCategoryCardModel3 =
        createModel(context, () => ElementCategoryCardModel());
    elementCategoryCardModel4 =
        createModel(context, () => ElementCategoryCardModel());
    elementCategoryCardModel5 =
        createModel(context, () => ElementCategoryCardModel());
    dictionaryItemModel1 = createModel(context, () => DictionaryItemModel());
    dictionaryItemModel2 = createModel(context, () => DictionaryItemModel());
    dictionaryItemModel3 = createModel(context, () => DictionaryItemModel());
    dictionaryItemModel4 = createModel(context, () => DictionaryItemModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    elementCategoryCardModel1.dispose();
    elementCategoryCardModel2.dispose();
    elementCategoryCardModel3.dispose();
    elementCategoryCardModel4.dispose();
    elementCategoryCardModel5.dispose();
    dictionaryItemModel1.dispose();
    dictionaryItemModel2.dispose();
    dictionaryItemModel3.dispose();
    dictionaryItemModel4.dispose();
    bottomNavModel.dispose();
  }
}
