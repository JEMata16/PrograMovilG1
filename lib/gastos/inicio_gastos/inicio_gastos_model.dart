import '/flutter_flow/flutter_flow_util.dart';
import 'inicio_gastos_widget.dart' show InicioGastosWidget;
import 'package:flutter/material.dart';

class InicioGastosModel extends FlutterFlowModel<InicioGastosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
