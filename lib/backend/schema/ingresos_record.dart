import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IngresosRecord extends FirestoreRecord {
  IngresosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tipoIngreso" field.
  String? _tipoIngreso;
  String get tipoIngreso => _tipoIngreso ?? '';
  bool hasTipoIngreso() => _tipoIngreso != null;

  // "monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  bool hasMonto() => _monto != null;

  // "fechaIngreso" field.
  DateTime? _fechaIngreso;
  DateTime? get fechaIngreso => _fechaIngreso;
  bool hasFechaIngreso() => _fechaIngreso != null;

  // "perfil" field.
  String? _perfil;
  String get perfil => _perfil ?? '';
  bool hasPerfil() => _perfil != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _tipoIngreso = snapshotData['tipoIngreso'] as String?;
    _monto = castToType<double>(snapshotData['monto']);
    _fechaIngreso = snapshotData['fechaIngreso'] as DateTime?;
    _perfil = snapshotData['perfil'] as String?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ingresos');

  static Stream<IngresosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IngresosRecord.fromSnapshot(s));

  static Future<IngresosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IngresosRecord.fromSnapshot(s));

  static IngresosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IngresosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IngresosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IngresosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IngresosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IngresosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIngresosRecordData({
  String? tipoIngreso,
  double? monto,
  DateTime? fechaIngreso,
  String? perfil,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipoIngreso': tipoIngreso,
      'monto': monto,
      'fechaIngreso': fechaIngreso,
      'perfil': perfil,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class IngresosRecordDocumentEquality implements Equality<IngresosRecord> {
  const IngresosRecordDocumentEquality();

  @override
  bool equals(IngresosRecord? e1, IngresosRecord? e2) {
    return e1?.tipoIngreso == e2?.tipoIngreso &&
        e1?.monto == e2?.monto &&
        e1?.fechaIngreso == e2?.fechaIngreso &&
        e1?.perfil == e2?.perfil &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(IngresosRecord? e) => const ListEquality()
      .hash([e?.tipoIngreso, e?.monto, e?.fechaIngreso, e?.perfil, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is IngresosRecord;
}
