import '/flutter_flow/flutter_flow_util.dart';
import 'agregar_perfil_familiar_widget.dart' show AgregarPerfilFamiliarWidget;
import 'package:flutter/material.dart';

class AgregarPerfilFamiliarModel
    extends FlutterFlowModel<AgregarPerfilFamiliarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for txt_familiar widget.
  FocusNode? txtFamiliarFocusNode;
  TextEditingController? txtFamiliarController;
  String? Function(BuildContext, String?)? txtFamiliarControllerValidator;
  // State field(s) for txt_inginc widget.
  FocusNode? txtIngincFocusNode;
  TextEditingController? txtIngincController;
  String? Function(BuildContext, String?)? txtIngincControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtFamiliarFocusNode?.dispose();
    txtFamiliarController?.dispose();

    txtIngincFocusNode?.dispose();
    txtIngincController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
