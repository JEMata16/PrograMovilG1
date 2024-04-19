import '/flutter_flow/flutter_flow_util.dart';
import 'ingresos_personales_widget.dart' show IngresosPersonalesWidget;
import 'package:flutter/material.dart';

class IngresosPersonalesModel
    extends FlutterFlowModel<IngresosPersonalesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
