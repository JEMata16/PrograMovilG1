// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<double?> getGastosPorPerfilFamiliar(String perfilFamiliar) async {
  double totalExpenses = 0;

  CollectionReference<Map<String, dynamic>> gastosCollection =
      FirebaseFirestore.instance.collection('gastos');

  QuerySnapshot querySnapshot =
      await gastosCollection.where('perfil', isEqualTo: perfilFamiliar).get();

  querySnapshot.docs.forEach((QueryDocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    totalExpenses += data['monto'];
  });

  return totalExpenses;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
