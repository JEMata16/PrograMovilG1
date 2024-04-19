// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<double> sumarGastos() async {
  double total = 0;
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('gastos').get();

  if (querySnapshot.docs.isNotEmpty) {
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      total += doc['monto'] as double;
    }
  }
  return total;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
