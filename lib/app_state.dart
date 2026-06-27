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

  bool isCategoryCompleted(String category) {
    return _completedCategories.contains(category);
  }

  bool isCategoryUnlocked(String category) {
    const order = ['음양', '오행', '천간', '지지', '십이운성', '합/충/형/해/파', '지장간', '십성', '납음오행'];
    final idx = order.indexOf(category);
    if (idx == 0) return true;
    if (idx < 0) return false;
    return _completedCategories.contains(order[idx - 1]);
  }
}
