import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_deuda_widget.dart' show EditarDeudaWidget;
import 'package:flutter/material.dart';

class EditarDeudaModel extends FlutterFlowModel<EditarDeudaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown_Perfil widget.
  String? dropDownPerfilValue;
  FormFieldController<String>? dropDownPerfilValueController;
  // State field(s) for txt_tituloDeuda widget.
  FocusNode? txtTituloDeudaFocusNode;
  TextEditingController? txtTituloDeudaController;
  String? Function(BuildContext, String?)? txtTituloDeudaControllerValidator;
  // State field(s) for int_monto widget.
  FocusNode? intMontoFocusNode;
  TextEditingController? intMontoController;
  String? Function(BuildContext, String?)? intMontoControllerValidator;
  // State field(s) for DropDown_tipo widget.
  String? dropDownTipoValue;
  FormFieldController<String>? dropDownTipoValueController;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtTituloDeudaFocusNode?.dispose();
    txtTituloDeudaController?.dispose();

    intMontoFocusNode?.dispose();
    intMontoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
