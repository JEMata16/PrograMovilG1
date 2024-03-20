import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'presupuestos_familiares_widget.dart' show PresupuestosFamiliaresWidget;
import 'package:flutter/material.dart';

class PresupuestosFamiliaresModel
    extends FlutterFlowModel<PresupuestosFamiliaresWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in ListTile widget.
  IngresosRecord? ingresos;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
