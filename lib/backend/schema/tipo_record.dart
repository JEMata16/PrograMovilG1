import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TipoRecord extends FirestoreRecord {
  TipoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tipo');

  static Stream<TipoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TipoRecord.fromSnapshot(s));

  static Future<TipoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TipoRecord.fromSnapshot(s));

  static TipoRecord fromSnapshot(DocumentSnapshot snapshot) => TipoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TipoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TipoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TipoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TipoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTipoRecordData({
  String? nombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class TipoRecordDocumentEquality implements Equality<TipoRecord> {
  const TipoRecordDocumentEquality();

  @override
  bool equals(TipoRecord? e1, TipoRecord? e2) {
    return e1?.nombre == e2?.nombre;
  }

  @override
  int hash(TipoRecord? e) => const ListEquality().hash([e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is TipoRecord;
}
