import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GastosRecord extends FirestoreRecord {
  GastosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "perfil" field.
  String? _perfil;
  String get perfil => _perfil ?? '';
  bool hasPerfil() => _perfil != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  bool hasMonto() => _monto != null;

  void _initializeFields() {
    _tipo = snapshotData['tipo'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _perfil = snapshotData['perfil'] as String?;
    _uid = snapshotData['uid'] as String?;
    _monto = castToType<double>(snapshotData['monto']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gastos');

  static Stream<GastosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GastosRecord.fromSnapshot(s));

  static Future<GastosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GastosRecord.fromSnapshot(s));

  static GastosRecord fromSnapshot(DocumentSnapshot snapshot) => GastosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GastosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GastosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GastosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GastosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGastosRecordData({
  String? tipo,
  DateTime? fecha,
  String? perfil,
  String? uid,
  double? monto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo': tipo,
      'fecha': fecha,
      'perfil': perfil,
      'uid': uid,
      'monto': monto,
    }.withoutNulls,
  );

  return firestoreData;
}

class GastosRecordDocumentEquality implements Equality<GastosRecord> {
  const GastosRecordDocumentEquality();

  @override
  bool equals(GastosRecord? e1, GastosRecord? e2) {
    return e1?.tipo == e2?.tipo &&
        e1?.fecha == e2?.fecha &&
        e1?.perfil == e2?.perfil &&
        e1?.uid == e2?.uid &&
        e1?.monto == e2?.monto;
  }

  @override
  int hash(GastosRecord? e) => const ListEquality()
      .hash([e?.tipo, e?.fecha, e?.perfil, e?.uid, e?.monto]);

  @override
  bool isValidKey(Object? o) => o is GastosRecord;
}
