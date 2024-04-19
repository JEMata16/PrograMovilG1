import '/flutter_flow/flutter_flow_util.dart';
import 'perfiles_familiares_widget.dart' show PerfilesFamiliaresWidget;
import 'package:flutter/material.dart';

class PerfilesFamiliaresModel
    extends FlutterFlowModel<PerfilesFamiliaresWidget> {
  ///  Local state fields for this page.

  DocumentReference? familiarReference;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getGastosPorPerfilFamiliar] action in Card widget.
  double? gasto;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
