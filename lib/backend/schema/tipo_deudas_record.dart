import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TipoDeudasRecord extends FirestoreRecord {
  TipoDeudasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tipoDeudas')
          : FirebaseFirestore.instance.collectionGroup('tipoDeudas');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tipoDeudas').doc(id);

  static Stream<TipoDeudasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TipoDeudasRecord.fromSnapshot(s));

  static Future<TipoDeudasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TipoDeudasRecord.fromSnapshot(s));

  static TipoDeudasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TipoDeudasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TipoDeudasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TipoDeudasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TipoDeudasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TipoDeudasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTipoDeudasRecordData({
  String? nombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class TipoDeudasRecordDocumentEquality implements Equality<TipoDeudasRecord> {
  const TipoDeudasRecordDocumentEquality();

  @override
  bool equals(TipoDeudasRecord? e1, TipoDeudasRecord? e2) {
    return e1?.nombre == e2?.nombre;
  }

  @override
  int hash(TipoDeudasRecord? e) => const ListEquality().hash([e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is TipoDeudasRecord;
}
