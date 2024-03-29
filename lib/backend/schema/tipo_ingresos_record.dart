import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TipoIngresosRecord extends FirestoreRecord {
  TipoIngresosRecord._(
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
      FirebaseFirestore.instance.collection('tipoIngresos');

  static Stream<TipoIngresosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TipoIngresosRecord.fromSnapshot(s));

  static Future<TipoIngresosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TipoIngresosRecord.fromSnapshot(s));

  static TipoIngresosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TipoIngresosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TipoIngresosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TipoIngresosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TipoIngresosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TipoIngresosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTipoIngresosRecordData({
  String? nombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class TipoIngresosRecordDocumentEquality
    implements Equality<TipoIngresosRecord> {
  const TipoIngresosRecordDocumentEquality();

  @override
  bool equals(TipoIngresosRecord? e1, TipoIngresosRecord? e2) {
    return e1?.nombre == e2?.nombre;
  }

  @override
  int hash(TipoIngresosRecord? e) => const ListEquality().hash([e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is TipoIngresosRecord;
}
