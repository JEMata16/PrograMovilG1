import '/flutter_flow/flutter_flow_util.dart';
import 'deudas_familiares_widget.dart' show DeudasFamiliaresWidget;
import 'package:flutter/material.dart';

class DeudasFamiliaresModel extends FlutterFlowModel<DeudasFamiliaresWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
