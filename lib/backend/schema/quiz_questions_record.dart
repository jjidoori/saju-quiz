import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizQuestionsRecord extends FirestoreRecord {
  QuizQuestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "questionText" field.
  String? _questionText;
  String get questionText => _questionText ?? '';
  bool hasQuestionText() => _questionText != null;

  // "targetHanja" field.
  String? _targetHanja;
  String get targetHanja => _targetHanja ?? '';
  bool hasTargetHanja() => _targetHanja != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  bool hasOptions() => _options != null;

  // "correctIndex" field.
  int? _correctIndex;
  int get correctIndex => _correctIndex ?? 0;
  bool hasCorrectIndex() => _correctIndex != null;

  // "explanationText" field.
  String? _explanationText;
  String get explanationText => _explanationText ?? '';
  bool hasExplanationText() => _explanationText != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _questionText = snapshotData['questionText'] as String?;
    _targetHanja = snapshotData['targetHanja'] as String?;
    _options = getDataList(snapshotData['options']);
    _correctIndex = castToType<int>(snapshotData['correctIndex']);
    _explanationText = snapshotData['explanationText'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quiz_questions');

  static Stream<QuizQuestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizQuestionsRecord.fromSnapshot(s));

  static Future<QuizQuestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizQuestionsRecord.fromSnapshot(s));

  static QuizQuestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizQuestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizQuestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizQuestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizQuestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizQuestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizQuestionsRecordData({
  String? type,
  String? questionText,
  String? targetHanja,
  int? correctIndex,
  String? explanationText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'questionText': questionText,
      'targetHanja': targetHanja,
      'correctIndex': correctIndex,
      'explanationText': explanationText,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizQuestionsRecordDocumentEquality
    implements Equality<QuizQuestionsRecord> {
  const QuizQuestionsRecordDocumentEquality();

  @override
  bool equals(QuizQuestionsRecord? e1, QuizQuestionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.type == e2?.type &&
        e1?.questionText == e2?.questionText &&
        e1?.targetHanja == e2?.targetHanja &&
        listEquality.equals(e1?.options, e2?.options) &&
        e1?.correctIndex == e2?.correctIndex &&
        e1?.explanationText == e2?.explanationText;
  }

  @override
  int hash(QuizQuestionsRecord? e) => const ListEquality().hash([
        e?.type,
        e?.questionText,
        e?.targetHanja,
        e?.options,
        e?.correctIndex,
        e?.explanationText
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizQuestionsRecord;
}
