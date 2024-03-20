import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FamiliaresRecord extends FirestoreRecord {
  FamiliaresRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "ingIniales" field.
  double? _ingIniales;
  double get ingIniales => _ingIniales ?? 0.0;
  bool hasIngIniales() => _ingIniales != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _ingIniales = castToType<double>(snapshotData['ingIniales']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('familiares');

  static Stream<FamiliaresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FamiliaresRecord.fromSnapshot(s));

  static Future<FamiliaresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FamiliaresRecord.fromSnapshot(s));

  static FamiliaresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FamiliaresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FamiliaresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FamiliaresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FamiliaresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FamiliaresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFamiliaresRecordData({
  String? nombre,
  double? ingIniales,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'ingIniales': ingIniales,
    }.withoutNulls,
  );

  return firestoreData;
}

class FamiliaresRecordDocumentEquality implements Equality<FamiliaresRecord> {
  const FamiliaresRecordDocumentEquality();

  @override
  bool equals(FamiliaresRecord? e1, FamiliaresRecord? e2) {
    return e1?.nombre == e2?.nombre && e1?.ingIniales == e2?.ingIniales;
  }

  @override
  int hash(FamiliaresRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.ingIniales]);

  @override
  bool isValidKey(Object? o) => o is FamiliaresRecord;
}
