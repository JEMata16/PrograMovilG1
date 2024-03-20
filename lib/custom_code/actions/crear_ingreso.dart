// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';

Future crearIngreso(String uid, String perfil, String tipo, double monto,
    DateTime fecha) async {
  final CollectionReference<Map<String, dynamic>> coleccion =
      FirebaseFirestore.instance.collection("ingresos");

  await coleccion.add({
    'uid': uid,
    'perfil': perfil,
    'tipo': tipo,
    'monto': monto,
    'fecha': fecha
  });
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
