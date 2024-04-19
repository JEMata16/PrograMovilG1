import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_ingreso_widget.dart' show EditarIngresoWidget;
import 'package:flutter/material.dart';

class EditarIngresoModel extends FlutterFlowModel<EditarIngresoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for perfilIngreso widget.
  String? perfilIngresoValue;
  FormFieldController<String>? perfilIngresoValueController;
  // State field(s) for tipoIngreso widget.
  String? tipoIngresoValue;
  FormFieldController<String>? tipoIngresoValueController;
  // State field(s) for txtMonto widget.
  FocusNode? txtMontoFocusNode;
  TextEditingController? txtMontoTextController;
  String? Function(BuildContext, String?)? txtMontoTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtMontoFocusNode?.dispose();
    txtMontoTextController?.dispose();
  }
}
