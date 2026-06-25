import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RemindersRecord extends FirestoreRecord {
  RemindersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "dayLabel" field.
  String? _dayLabel;
  String get dayLabel => _dayLabel ?? '';
  bool hasDayLabel() => _dayLabel != null;

  // "timeString" field.
  String? _timeString;
  String get timeString => _timeString ?? '';
  bool hasTimeString() => _timeString != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  void _initializeFields() {
    _dayLabel = snapshotData['dayLabel'] as String?;
    _timeString = snapshotData['timeString'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reminders');

  static Stream<RemindersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RemindersRecord.fromSnapshot(s));

  static Future<RemindersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RemindersRecord.fromSnapshot(s));

  static RemindersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RemindersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RemindersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RemindersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RemindersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RemindersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRemindersRecordData({
  String? dayLabel,
  String? timeString,
  bool? isActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dayLabel': dayLabel,
      'timeString': timeString,
      'isActive': isActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class RemindersRecordDocumentEquality implements Equality<RemindersRecord> {
  const RemindersRecordDocumentEquality();

  @override
  bool equals(RemindersRecord? e1, RemindersRecord? e2) {
    return e1?.dayLabel == e2?.dayLabel &&
        e1?.timeString == e2?.timeString &&
        e1?.isActive == e2?.isActive;
  }

  @override
  int hash(RemindersRecord? e) =>
      const ListEquality().hash([e?.dayLabel, e?.timeString, e?.isActive]);

  @override
  bool isValidKey(Object? o) => o is RemindersRecord;
}
