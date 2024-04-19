import '/flutter_flow/flutter_flow_util.dart';
import 'inicio_presupuestos_widget.dart' show InicioPresupuestosWidget;
import 'package:flutter/material.dart';

class InicioPresupuestosModel
    extends FlutterFlowModel<InicioPresupuestosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
