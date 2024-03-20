import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeudasRecord extends FirestoreRecord {
  DeudasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "perfil" field.
  String? _perfil;
  String get perfil => _perfil ?? '';
  bool hasPerfil() => _perfil != null;

  // "tituloDeuda" field.
  String? _tituloDeuda;
  String get tituloDeuda => _tituloDeuda ?? '';
  bool hasTituloDeuda() => _tituloDeuda != null;

  // "monto" field.
  double? _monto;
  double get monto => _monto ?? 0.0;
  bool hasMonto() => _monto != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  bool hasTipo() => _tipo != null;

  // "fechaPago" field.
  DateTime? _fechaPago;
  DateTime? get fechaPago => _fechaPago;
  bool hasFechaPago() => _fechaPago != null;

  void _initializeFields() {
    _perfil = snapshotData['perfil'] as String?;
    _tituloDeuda = snapshotData['tituloDeuda'] as String?;
    _monto = castToType<double>(snapshotData['monto']);
    _tipo = snapshotData['tipo'] as String?;
    _fechaPago = snapshotData['fechaPago'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('deudas');

  static Stream<DeudasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeudasRecord.fromSnapshot(s));

  static Future<DeudasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeudasRecord.fromSnapshot(s));

  static DeudasRecord fromSnapshot(DocumentSnapshot snapshot) => DeudasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeudasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeudasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeudasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeudasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeudasRecordData({
  String? perfil,
  String? tituloDeuda,
  double? monto,
  String? tipo,
  DateTime? fechaPago,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'perfil': perfil,
      'tituloDeuda': tituloDeuda,
      'monto': monto,
      'tipo': tipo,
      'fechaPago': fechaPago,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeudasRecordDocumentEquality implements Equality<DeudasRecord> {
  const DeudasRecordDocumentEquality();

  @override
  bool equals(DeudasRecord? e1, DeudasRecord? e2) {
    return e1?.perfil == e2?.perfil &&
        e1?.tituloDeuda == e2?.tituloDeuda &&
        e1?.monto == e2?.monto &&
        e1?.tipo == e2?.tipo &&
        e1?.fechaPago == e2?.fechaPago;
  }

  @override
  int hash(DeudasRecord? e) => const ListEquality()
      .hash([e?.perfil, e?.tituloDeuda, e?.monto, e?.tipo, e?.fechaPago]);

  @override
  bool isValidKey(Object? o) => o is DeudasRecord;
}
