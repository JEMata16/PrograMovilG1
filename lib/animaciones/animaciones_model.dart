import '/flutter_flow/flutter_flow_util.dart';
import 'animaciones_widget.dart' show AnimacionesWidget;
import 'package:flutter/material.dart';

class AnimacionesModel extends FlutterFlowModel<AnimacionesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
