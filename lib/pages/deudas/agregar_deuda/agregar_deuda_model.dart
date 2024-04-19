import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'agregar_deuda_widget.dart' show AgregarDeudaWidget;
import 'package:flutter/material.dart';

class AgregarDeudaModel extends FlutterFlowModel<AgregarDeudaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown_Perfil widget.
  String? dropDownPerfilValue;
  FormFieldController<String>? dropDownPerfilValueController;
  // State field(s) for txt_tituloDeuda widget.
  FocusNode? txtTituloDeudaFocusNode;
  TextEditingController? txtTituloDeudaTextController;
  String? Function(BuildContext, String?)?
      txtTituloDeudaTextControllerValidator;
  // State field(s) for int_monto widget.
  FocusNode? intMontoFocusNode;
  TextEditingController? intMontoTextController;
  String? Function(BuildContext, String?)? intMontoTextControllerValidator;
  // State field(s) for DropDown_tipo widget.
  String? dropDownTipoValue;
  FormFieldController<String>? dropDownTipoValueController;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtTituloDeudaFocusNode?.dispose();
    txtTituloDeudaTextController?.dispose();

    intMontoFocusNode?.dispose();
    intMontoTextController?.dispose();
  }
}
