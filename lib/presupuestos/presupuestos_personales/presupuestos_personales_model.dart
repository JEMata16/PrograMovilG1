import '/flutter_flow/flutter_flow_util.dart';
import 'presupuestos_personales_widget.dart' show PresupuestosPersonalesWidget;
import 'package:flutter/material.dart';

class PresupuestosPersonalesModel
    extends FlutterFlowModel<PresupuestosPersonalesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
