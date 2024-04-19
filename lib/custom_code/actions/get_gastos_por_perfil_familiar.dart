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

  try {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('gastos')
        .where('perfil', isEqualTo: perfilFamiliar)
        .get();

    querySnapshot.docs.forEach((QueryDocumentSnapshot doc) {
      final dynamic data = doc.data();
      final dynamic monto = data?['monto'];
      totalExpenses += monto?.toDouble() ?? 0;
    });

    return totalExpenses;
  } catch (e) {
    print("Error getting expenses: $e");
    return null;
  }

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
