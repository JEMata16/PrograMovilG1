import '/flutter_flow/flutter_flow_util.dart';
import 'presupuestos_familiares_widget.dart' show PresupuestosFamiliaresWidget;
import 'package:flutter/material.dart';

class PresupuestosFamiliaresModel
    extends FlutterFlowModel<PresupuestosFamiliaresWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
