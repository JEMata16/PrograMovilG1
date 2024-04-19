import '/flutter_flow/flutter_flow_util.dart';
import 'agregar_perfil_familiar_widget.dart' show AgregarPerfilFamiliarWidget;
import 'package:flutter/material.dart';

class AgregarPerfilFamiliarModel
    extends FlutterFlowModel<AgregarPerfilFamiliarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txt_familiar widget.
  FocusNode? txtFamiliarFocusNode;
  TextEditingController? txtFamiliarTextController;
  String? Function(BuildContext, String?)? txtFamiliarTextControllerValidator;
  // State field(s) for txt_inginc widget.
  FocusNode? txtIngincFocusNode;
  TextEditingController? txtIngincTextController;
  String? Function(BuildContext, String?)? txtIngincTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtFamiliarFocusNode?.dispose();
    txtFamiliarTextController?.dispose();

    txtIngincFocusNode?.dispose();
    txtIngincTextController?.dispose();
  }
}
