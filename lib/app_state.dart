import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();
  factory FFAppState() {
    return _instance;
  }
  FFAppState._internal();
  static void reset() {
    _instance = FFAppState._internal();
  }
  Future initializePersistedState() async {}
  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _userLevel = 1;
  int get userLevel => _userLevel;
  set userLevel(int value) {
    _userLevel = value;
  }

  int _totalPoints = 0;
  int get totalPoints => _totalPoints;
  set totalPoints(int value) {
    _totalPoints = value;
  }

  int _streakCount = 0;
  int get streakCount => _streakCount;
  set streakCount(int value) {
    _streakCount = value;
  }

  bool _hanjaEnabled = true;
  bool get hanjaEnabled => _hanjaEnabled;
  set hanjaEnabled(bool value) {
    _hanjaEnabled = value;
  }

  bool _soundEnabled = false;
  bool get soundEnabled => _soundEnabled;
  set soundEnabled(bool value) {
    _soundEnabled = value;
  }

  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  set searchQuery(String value) {
    _searchQuery = value;
  }

  bool _isSearchMode = false;
  bool get isSearchMode => _isSearchMode;
  set isSearchMode(bool value) {
    _isSearchMode = value;
  }

  String _dictionaryFilter = 'All';
  String get dictionaryFilter => _dictionaryFilter;
  set dictionaryFilter(String value) {
    _dictionaryFilter = value;
  }

  List<String> _todayQuestionIds = [];
  List<String> get todayQuestionIds => _todayQuestionIds;
  set todayQuestionIds(List<String> value) {
    _todayQuestionIds = value;
  }
}
