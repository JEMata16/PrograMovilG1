import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PresupuestosRecord extends FirestoreRecord {
  PresupuestosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "perfil" field.
  String? _perfil;
  String get perfil => _perfil ?? '';
  bool hasPerfil() => _perfil != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  bool hasMonto() => _monto != null;

  void _initializeFields() {
    _perfil = snapshotData['perfil'] as String?;
    _tipo = snapshotData['tipo'] as String?;
    _monto = castToType<double>(snapshotData['monto']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('presupuestos');

  static Stream<PresupuestosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PresupuestosRecord.fromSnapshot(s));

  static Future<PresupuestosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PresupuestosRecord.fromSnapshot(s));

  static PresupuestosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PresupuestosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PresupuestosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PresupuestosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PresupuestosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PresupuestosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPresupuestosRecordData({
  String? perfil,
  String? tipo,
  double? monto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'perfil': perfil,
      'tipo': tipo,
      'monto': monto,
    }.withoutNulls,
  );

  return firestoreData;
}

class PresupuestosRecordDocumentEquality
    implements Equality<PresupuestosRecord> {
  const PresupuestosRecordDocumentEquality();

  @override
  bool equals(PresupuestosRecord? e1, PresupuestosRecord? e2) {
    return e1?.perfil == e2?.perfil &&
        e1?.tipo == e2?.tipo &&
        e1?.monto == e2?.monto;
  }

  @override
  int hash(PresupuestosRecord? e) =>
      const ListEquality().hash([e?.perfil, e?.tipo, e?.monto]);

  @override
  bool isValidKey(Object? o) => o is PresupuestosRecord;
}
