import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StemsRecord extends FirestoreRecord {
  StemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hanja" field.
  String? _hanja;
  String get hanja => _hanja ?? '';
  bool hasHanja() => _hanja != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "meaning" field.
  String? _meaning;
  String get meaning => _meaning ?? '';
  bool hasMeaning() => _meaning != null;

  // "elementType" field.
  String? _elementType;
  String get elementType => _elementType ?? '';
  bool hasElementType() => _elementType != null;

  // "yinYang" field.
  String? _yinYang;
  String get yinYang => _yinYang ?? '';
  bool hasYinYang() => _yinYang != null;

  // "season" field.
  String? _season;
  String get season => _season ?? '';
  bool hasSeason() => _season != null;

  // "direction" field.
  String? _direction;
  String get direction => _direction ?? '';
  bool hasDirection() => _direction != null;

  void _initializeFields() {
    _hanja = snapshotData['hanja'] as String?;
    _name = snapshotData['name'] as String?;
    _meaning = snapshotData['meaning'] as String?;
    _elementType = snapshotData['elementType'] as String?;
    _yinYang = snapshotData['yinYang'] as String?;
    _season = snapshotData['season'] as String?;
    _direction = snapshotData['direction'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stems');

  static Stream<StemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StemsRecord.fromSnapshot(s));

  static Future<StemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StemsRecord.fromSnapshot(s));

  static StemsRecord fromSnapshot(DocumentSnapshot snapshot) => StemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStemsRecordData({
  String? hanja,
  String? name,
  String? meaning,
  String? elementType,
  String? yinYang,
  String? season,
  String? direction,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hanja': hanja,
      'name': name,
      'meaning': meaning,
      'elementType': elementType,
      'yinYang': yinYang,
      'season': season,
      'direction': direction,
    }.withoutNulls,
  );

  return firestoreData;
}

class StemsRecordDocumentEquality implements Equality<StemsRecord> {
  const StemsRecordDocumentEquality();

  @override
  bool equals(StemsRecord? e1, StemsRecord? e2) {
    return e1?.hanja == e2?.hanja &&
        e1?.name == e2?.name &&
        e1?.meaning == e2?.meaning &&
        e1?.elementType == e2?.elementType &&
        e1?.yinYang == e2?.yinYang &&
        e1?.season == e2?.season &&
        e1?.direction == e2?.direction;
  }

  @override
  int hash(StemsRecord? e) => const ListEquality().hash([
        e?.hanja,
        e?.name,
        e?.meaning,
        e?.elementType,
        e?.yinYang,
        e?.season,
        e?.direction
      ]);

  @override
  bool isValidKey(Object? o) => o is StemsRecord;
}
