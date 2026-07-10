import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();
  factory FFAppState() {
    return _instance;
  }
  FFAppState._internal();
  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    final saved = html.window.localStorage['completedCategories'];
    if (saved != null && saved.isNotEmpty) {
      _completedCategories = saved.split(',');
    } else {
      _completedCategories = [];
    }
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _userLevel = 1;
  int get userLevel => _userLevel;
  set userLevel(int value) { _userLevel = value; }

  int _totalPoints = 0;
  int get totalPoints => _totalPoints;
  set totalPoints(int value) { _totalPoints = value; }

  int _streakCount = 0;
  int get streakCount => _streakCount;
  set streakCount(int value) { _streakCount = value; }

  bool _hanjaEnabled = true;
  bool get hanjaEnabled => _hanjaEnabled;
  set hanjaEnabled(bool value) { _hanjaEnabled = value; }

  bool _soundEnabled = false;
  bool get soundEnabled => _soundEnabled;
  set soundEnabled(bool value) { _soundEnabled = value; }

  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  set searchQuery(String value) { _searchQuery = value; }

  bool _ohangAccordionExpanded = false;
  bool get ohangAccordionExpanded => _ohangAccordionExpanded;
  set ohangAccordionExpanded(bool value) { _ohangAccordionExpanded = value; }

  bool _eumyangAccordionExpanded = false;
  bool get eumyangAccordionExpanded => _eumyangAccordionExpanded;
  set eumyangAccordionExpanded(bool value) { _eumyangAccordionExpanded = value; }

  bool _isSearchMode = false;
  bool get isSearchMode => _isSearchMode;
  set isSearchMode(bool value) { _isSearchMode = value; }

  String _dictionaryFilter = 'All';
  String get dictionaryFilter => _dictionaryFilter;
  set dictionaryFilter(String value) { _dictionaryFilter = value; }

  List<String> _todayQuestionIds = [];
  List<String> get todayQuestionIds => _todayQuestionIds;
  set todayQuestionIds(List<String> value) { _todayQuestionIds = value; }

  List<String> _completedCategories = [];
  List<String> get completedCategories => _completedCategories;
  set completedCategories(List<String> value) { _completedCategories = value; }

  void completeCategory(String category) {
    if (!_completedCategories.contains(category)) {
      _completedCategories = [..._completedCategories, category];
      html.window.localStorage['completedCategories'] = _completedCategories.join(',');
      notifyListeners();
    }
  }

  // 진행 상황 전체 초기화 (테스트용)
  void resetProgress() {
    _completedCategories = [];
    _todayQuestionIds = [];
    html.window.localStorage.remove('completedCategories');
    notifyListeners();
  }

  bool isCategoryCompleted(String category) {
    return _completedCategories.contains(category);
  }

  bool isCategoryUnlocked(String category) {
    const order = ['음양', '오행', '천간', '지지', '십이운성', '합/충/형/해/파', '지장간', '십성', '납음오행', '신살'];
    final idx = order.indexOf(category);
    if (idx == 0) return true;
    if (idx < 0) return false;
    // 음양·오행은 하위 카테고리의 마지막 단계(응용)를 완료해야 다음이 열림
    if (order[idx - 1] == '음양') {
      return _completedCategories.contains('음양_응용');
    }
    if (order[idx - 1] == '오행') {
      return _completedCategories.contains('오행_응용');
    }
    return _completedCategories.contains(order[idx - 1]);
  }
}
