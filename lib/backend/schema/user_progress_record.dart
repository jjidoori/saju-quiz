import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProgressRecord extends FirestoreRecord {
  UserProgressRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "currentLevel" field.
  int? _currentLevel;
  int get currentLevel => _currentLevel ?? 0;
  bool hasCurrentLevel() => _currentLevel != null;

  // "totalScore" field.
  int? _totalScore;
  int get totalScore => _totalScore ?? 0;
  bool hasTotalScore() => _totalScore != null;

  // "streakDays" field.
  int? _streakDays;
  int get streakDays => _streakDays ?? 0;
  bool hasStreakDays() => _streakDays != null;

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
    _currentLevel = castToType<int>(snapshotData['currentLevel']);
    _totalScore = castToType<int>(snapshotData['totalScore']);
    _streakDays = castToType<int>(snapshotData['streakDays']);
    _accuracyPercentage =
        castToType<double>(snapshotData['accuracyPercentage']);
    _masteredHanja = getDataList(snapshotData['masteredHanja']);
    _unlockedAchievements = getDataList(snapshotData['unlockedAchievements']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_progress');

  static Stream<UserProgressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserProgressRecord.fromSnapshot(s));

  static Future<UserProgressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserProgressRecord.fromSnapshot(s));

  static UserProgressRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserProgressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserProgressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserProgressRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserProgressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserProgressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserProgressRecordData({
  int? currentLevel,
  int? totalScore,
  int? streakDays,
  double? accuracyPercentage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'currentLevel': currentLevel,
      'totalScore': totalScore,
      'streakDays': streakDays,
      'accuracyPercentage': accuracyPercentage,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserProgressRecordDocumentEquality
    implements Equality<UserProgressRecord> {
  const UserProgressRecordDocumentEquality();

  @override
  bool equals(UserProgressRecord? e1, UserProgressRecord? e2) {
    const listEquality = ListEquality();
    return e1?.currentLevel == e2?.currentLevel &&
        e1?.totalScore == e2?.totalScore &&
        e1?.streakDays == e2?.streakDays &&
        e1?.accuracyPercentage == e2?.accuracyPercentage &&
        listEquality.equals(e1?.masteredHanja, e2?.masteredHanja) &&
        listEquality.equals(e1?.unlockedAchievements, e2?.unlockedAchievements);
  }

  @override
  int hash(UserProgressRecord? e) => const ListEquality().hash([
        e?.currentLevel,
        e?.totalScore,
        e?.streakDays,
        e?.accuracyPercentage,
        e?.masteredHanja,
        e?.unlockedAchievements
      ]);

  @override
  bool isValidKey(Object? o) => o is UserProgressRecord;
}
