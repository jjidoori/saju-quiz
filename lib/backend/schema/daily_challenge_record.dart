import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DailyChallengeRecord extends FirestoreRecord {
  DailyChallengeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "questionText" field.
  String? _questionText;
  String get questionText => _questionText ?? '';
  bool hasQuestionText() => _questionText != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  bool hasOptions() => _options != null;

  // "explanationText" field.
  String? _explanationText;
  String get explanationText => _explanationText ?? '';
  bool hasExplanationText() => _explanationText != null;

  // "energyTheme" field.
  String? _energyTheme;
  String get energyTheme => _energyTheme ?? '';
  bool hasEnergyTheme() => _energyTheme != null;

  // "correctIndex" field.
  int? _correctIndex;
  int get correctIndex => _correctIndex ?? 0;
  bool hasCorrectIndex() => _correctIndex != null;

  void _initializeFields() {
    _questionText = snapshotData['questionText'] as String?;
    _options = getDataList(snapshotData['options']);
    _explanationText = snapshotData['explanationText'] as String?;
    _energyTheme = snapshotData['energyTheme'] as String?;
    _correctIndex = castToType<int>(snapshotData['correctIndex']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('daily_challenge');

  static Stream<DailyChallengeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DailyChallengeRecord.fromSnapshot(s));

  static Future<DailyChallengeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DailyChallengeRecord.fromSnapshot(s));

  static DailyChallengeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DailyChallengeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DailyChallengeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DailyChallengeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DailyChallengeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DailyChallengeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDailyChallengeRecordData({
  String? questionText,
  String? explanationText,
  String? energyTheme,
  int? correctIndex,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'questionText': questionText,
      'explanationText': explanationText,
      'energyTheme': energyTheme,
      'correctIndex': correctIndex,
    }.withoutNulls,
  );

  return firestoreData;
}

class DailyChallengeRecordDocumentEquality
    implements Equality<DailyChallengeRecord> {
  const DailyChallengeRecordDocumentEquality();

  @override
  bool equals(DailyChallengeRecord? e1, DailyChallengeRecord? e2) {
    const listEquality = ListEquality();
    return e1?.questionText == e2?.questionText &&
        listEquality.equals(e1?.options, e2?.options) &&
        e1?.explanationText == e2?.explanationText &&
        e1?.energyTheme == e2?.energyTheme &&
        e1?.correctIndex == e2?.correctIndex;
  }

  @override
  int hash(DailyChallengeRecord? e) => const ListEquality().hash([
        e?.questionText,
        e?.options,
        e?.explanationText,
        e?.energyTheme,
        e?.correctIndex
      ]);

  @override
  bool isValidKey(Object? o) => o is DailyChallengeRecord;
}
