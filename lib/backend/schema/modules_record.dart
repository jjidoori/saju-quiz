import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModulesRecord extends FirestoreRecord {
  ModulesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "subtitle" field.
  String? _subtitle;
  String get subtitle => _subtitle ?? '';
  bool hasSubtitle() => _subtitle != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  // "orderIndex" field.
  int? _orderIndex;
  int get orderIndex => _orderIndex ?? 0;
  bool hasOrderIndex() => _orderIndex != null;

  // "isLocked" field.
  bool? _isLocked;
  bool get isLocked => _isLocked ?? false;
  bool hasIsLocked() => _isLocked != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _subtitle = snapshotData['subtitle'] as String?;
    _icon = snapshotData['icon'] as String?;
    _orderIndex = castToType<int>(snapshotData['orderIndex']);
    _isLocked = snapshotData['isLocked'] as bool?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('modules');

  static Stream<ModulesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModulesRecord.fromSnapshot(s));

  static Future<ModulesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ModulesRecord.fromSnapshot(s));

  static ModulesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ModulesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModulesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModulesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModulesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModulesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModulesRecordData({
  String? title,
  String? subtitle,
  String? icon,
  int? orderIndex,
  bool? isLocked,
  bool? isCompleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'icon': icon,
      'orderIndex': orderIndex,
      'isLocked': isLocked,
      'isCompleted': isCompleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModulesRecordDocumentEquality implements Equality<ModulesRecord> {
  const ModulesRecordDocumentEquality();

  @override
  bool equals(ModulesRecord? e1, ModulesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.subtitle == e2?.subtitle &&
        e1?.icon == e2?.icon &&
        e1?.orderIndex == e2?.orderIndex &&
        e1?.isLocked == e2?.isLocked &&
        e1?.isCompleted == e2?.isCompleted;
  }

  @override
  int hash(ModulesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.subtitle,
        e?.icon,
        e?.orderIndex,
        e?.isLocked,
        e?.isCompleted
      ]);

  @override
  bool isValidKey(Object? o) => o is ModulesRecord;
}
