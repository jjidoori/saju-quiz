import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "birth_date" field.
  String? _birthDate;
  String get birthDate => _birthDate ?? '';
  bool hasBirthDate() => _birthDate != null;

  // "calendar_type" field.
  String? _calendarType;
  String get calendarType => _calendarType ?? '';
  bool hasCalendarType() => _calendarType != null;

  // "is_leap_month" field.
  bool? _isLeapMonth;
  bool get isLeapMonth => _isLeapMonth ?? false;
  bool hasIsLeapMonth() => _isLeapMonth != null;

  // "birth_time" field.
  String? _birthTime;
  String get birthTime => _birthTime ?? '';
  bool hasBirthTime() => _birthTime != null;

  // "saju_year_stem" field.
  String? _sajuYearStem;
  String get sajuYearStem => _sajuYearStem ?? '';
  bool hasSajuYearStem() => _sajuYearStem != null;

  // "saju_year_branch" field.
  String? _sajuYearBranch;
  String get sajuYearBranch => _sajuYearBranch ?? '';
  bool hasSajuYearBranch() => _sajuYearBranch != null;

  // "saju_month_stem" field.
  String? _sajuMonthStem;
  String get sajuMonthStem => _sajuMonthStem ?? '';
  bool hasSajuMonthStem() => _sajuMonthStem != null;

  // "saju_month_branch" field.
  String? _sajuMonthBranch;
  String get sajuMonthBranch => _sajuMonthBranch ?? '';
  bool hasSajuMonthBranch() => _sajuMonthBranch != null;

  // "saju_day_stem" field.
  String? _sajuDayStem;
  String get sajuDayStem => _sajuDayStem ?? '';
  bool hasSajuDayStem() => _sajuDayStem != null;

  // "saju_day_branch" field.
  String? _sajuDayBranch;
  String get sajuDayBranch => _sajuDayBranch ?? '';
  bool hasSajuDayBranch() => _sajuDayBranch != null;

  // "saju_hour_stem" field.
  String? _sajuHourStem;
  String get sajuHourStem => _sajuHourStem ?? '';
  bool hasSajuHourStem() => _sajuHourStem != null;

  // "saju_hour_branch" field.
  String? _sajuHourBranch;
  String get sajuHourBranch => _sajuHourBranch ?? '';
  bool hasSajuHourBranch() => _sajuHourBranch != null;

  // "currentStreak" field.
  int? _currentStreak;
  int get currentStreak => _currentStreak ?? 0;
  bool hasCurrentStreak() => _currentStreak != null;

  // "longestStreak" field.
  int? _longestStreak;
  int get longestStreak => _longestStreak ?? 0;
  bool hasLongestStreak() => _longestStreak != null;

  // "lastCompletedDate" field.
  String? _lastCompletedDate;
  String get lastCompletedDate => _lastCompletedDate ?? '';
  bool hasLastCompletedDate() => _lastCompletedDate != null;

  // "totalScore" field.
  int? _totalScore;
  int get totalScore => _totalScore ?? 0;
  bool hasTotalScore() => _totalScore != null;

  // "currentLevel" field.
  int? _currentLevel;
  int get currentLevel => _currentLevel ?? 0;
  bool hasCurrentLevel() => _currentLevel != null;

  // "accuracyPercentage" field.
  double? _accuracyPercentage;
  double get accuracyPercentage => _accuracyPercentage ?? 0.0;
  bool hasAccuracyPercentage() => _accuracyPercentage != null;

  // "masteredHanja" field.
  List<String>? _masteredHanja;
  List<String> get masteredHanja => _masteredHanja ?? const [];
  bool hasMasteredHanja() => _masteredHanja != null;

  // "unlockedAchievements" field.
  List<String>? _unlockedAchievements;
  List<String> get unlockedAchievements => _unlockedAchievements ?? const [];
  bool hasUnlockedAchievements() => _unlockedAchievements != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _birthDate = snapshotData['birth_date'] as String?;
    _calendarType = snapshotData['calendar_type'] as String?;
    _isLeapMonth = snapshotData['is_leap_month'] as bool?;
    _birthTime = snapshotData['birth_time'] as String?;
    _sajuYearStem = snapshotData['saju_year_stem'] as String?;
    _sajuYearBranch = snapshotData['saju_year_branch'] as String?;
    _sajuMonthStem = snapshotData['saju_month_stem'] as String?;
    _sajuMonthBranch = snapshotData['saju_month_branch'] as String?;
    _sajuDayStem = snapshotData['saju_day_stem'] as String?;
    _sajuDayBranch = snapshotData['saju_day_branch'] as String?;
    _sajuHourStem = snapshotData['saju_hour_stem'] as String?;
    _sajuHourBranch = snapshotData['saju_hour_branch'] as String?;
    _currentStreak = castToType<int>(snapshotData['currentStreak']);
    _longestStreak = castToType<int>(snapshotData['longestStreak']);
    _lastCompletedDate = snapshotData['lastCompletedDate'] as String?;
    _totalScore = castToType<int>(snapshotData['totalScore']);
    _currentLevel = castToType<int>(snapshotData['currentLevel']);
    _accuracyPercentage =
        castToType<double>(snapshotData['accuracyPercentage']);
    _masteredHanja = getDataList(snapshotData['masteredHanja']);
    _unlockedAchievements = getDataList(snapshotData['unlockedAchievements']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? birthDate,
  String? calendarType,
  bool? isLeapMonth,
  String? birthTime,
  String? sajuYearStem,
  String? sajuYearBranch,
  String? sajuMonthStem,
  String? sajuMonthBranch,
  String? sajuDayStem,
  String? sajuDayBranch,
  String? sajuHourStem,
  String? sajuHourBranch,
  int? currentStreak,
  int? longestStreak,
  String? lastCompletedDate,
  int? totalScore,
  int? currentLevel,
  double? accuracyPercentage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'birth_date': birthDate,
      'calendar_type': calendarType,
      'is_leap_month': isLeapMonth,
      'birth_time': birthTime,
      'saju_year_stem': sajuYearStem,
      'saju_year_branch': sajuYearBranch,
      'saju_month_stem': sajuMonthStem,
      'saju_month_branch': sajuMonthBranch,
      'saju_day_stem': sajuDayStem,
      'saju_day_branch': sajuDayBranch,
      'saju_hour_stem': sajuHourStem,
      'saju_hour_branch': sajuHourBranch,
      'currentStreak': currentStreak,
      'longestStreak': longestStreak,
      'lastCompletedDate': lastCompletedDate,
      'totalScore': totalScore,
      'currentLevel': currentLevel,
      'accuracyPercentage': accuracyPercentage,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.birthDate == e2?.birthDate &&
        e1?.calendarType == e2?.calendarType &&
        e1?.isLeapMonth == e2?.isLeapMonth &&
        e1?.birthTime == e2?.birthTime &&
        e1?.sajuYearStem == e2?.sajuYearStem &&
        e1?.sajuYearBranch == e2?.sajuYearBranch &&
        e1?.sajuMonthStem == e2?.sajuMonthStem &&
        e1?.sajuMonthBranch == e2?.sajuMonthBranch &&
        e1?.sajuDayStem == e2?.sajuDayStem &&
        e1?.sajuDayBranch == e2?.sajuDayBranch &&
        e1?.sajuHourStem == e2?.sajuHourStem &&
        e1?.sajuHourBranch == e2?.sajuHourBranch &&
        e1?.currentStreak == e2?.currentStreak &&
        e1?.longestStreak == e2?.longestStreak &&
        e1?.lastCompletedDate == e2?.lastCompletedDate &&
        e1?.totalScore == e2?.totalScore &&
        e1?.currentLevel == e2?.currentLevel &&
        e1?.accuracyPercentage == e2?.accuracyPercentage &&
        listEquality.equals(e1?.masteredHanja, e2?.masteredHanja) &&
        listEquality.equals(e1?.unlockedAchievements, e2?.unlockedAchievements);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.birthDate,
        e?.calendarType,
        e?.isLeapMonth,
        e?.birthTime,
        e?.sajuYearStem,
        e?.sajuYearBranch,
        e?.sajuMonthStem,
        e?.sajuMonthBranch,
        e?.sajuDayStem,
        e?.sajuDayBranch,
        e?.sajuHourStem,
        e?.sajuHourBranch,
        e?.currentStreak,
        e?.longestStreak,
        e?.lastCompletedDate,
        e?.totalScore,
        e?.currentLevel,
        e?.accuracyPercentage,
        e?.masteredHanja,
        e?.unlockedAchievements
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
