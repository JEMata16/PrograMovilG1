import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_gasto_widget.dart' show EditarGastoWidget;
import 'package:flutter/material.dart';

class EditarGastoModel extends FlutterFlowModel<EditarGastoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for perfilGasto widget.
  String? perfilGastoValue;
  FormFieldController<String>? perfilGastoValueController;
  // State field(s) for tipoGasto widget.
  String? tipoGastoValue;
  FormFieldController<String>? tipoGastoValueController;
  // State field(s) for txtMonto widget.
  FocusNode? txtMontoFocusNode;
  TextEditingController? txtMontoController;
  String? Function(BuildContext, String?)? txtMontoControllerValidator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtMontoFocusNode?.dispose();
    txtMontoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
