import '/flutter_flow/flutter_flow_util.dart';
import 'gastos_familiares_widget.dart' show GastosFamiliaresWidget;
import 'package:flutter/material.dart';

class GastosFamiliaresModel extends FlutterFlowModel<GastosFamiliaresWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
