import '/flutter_flow/flutter_flow_util.dart';
import 'inicio_deudas_widget.dart' show InicioDeudasWidget;
import 'package:flutter/material.dart';

class InicioDeudasModel extends FlutterFlowModel<InicioDeudasWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
