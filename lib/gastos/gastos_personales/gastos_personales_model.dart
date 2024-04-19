import '/flutter_flow/flutter_flow_util.dart';
import 'gastos_personales_widget.dart' show GastosPersonalesWidget;
import 'package:flutter/material.dart';

class GastosPersonalesModel extends FlutterFlowModel<GastosPersonalesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
