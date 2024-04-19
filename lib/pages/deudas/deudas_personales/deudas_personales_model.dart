import '/flutter_flow/flutter_flow_util.dart';
import 'deudas_personales_widget.dart' show DeudasPersonalesWidget;
import 'package:flutter/material.dart';

class DeudasPersonalesModel extends FlutterFlowModel<DeudasPersonalesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
