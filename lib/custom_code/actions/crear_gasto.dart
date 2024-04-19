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

Future crearGasto(BuildContext context, String uid, String perfil, String tipo,
    double monto, DateTime fecha) async {
  final CollectionReference<Map<String, dynamic>> gasto =
      FirebaseFirestore.instance.collection("gastos");
  final CollectionReference<Map<String, dynamic>> presupuesto =
      FirebaseFirestore.instance.collection("presupuestos");

  QuerySnapshot presupuestoSnapshot = await presupuesto
      .where('tipo', isEqualTo: tipo)
      .where('perfil', isEqualTo: perfil)
      .get();

  if (presupuestoSnapshot.docs.isNotEmpty) {
    // Obtener el primer presupuesto encontrado
    double montoPresupuesto = presupuestoSnapshot.docs.first['monto'];

    if (monto > montoPresupuesto) {
      // Mostrar una alerta si el monto del gasto es mayor que el monto del presupuesto
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alerta'),
            content: Text(
                'Estás excediendo el presupuesto para este tipo de gasto.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      await gasto.add({
        'uid': uid,
        'perfil': perfil,
        'tipo': tipo,
        'monto': monto,
        'fecha': fecha
      });
      context.pushNamed("InicioGastos");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('El gasto fue agregado correctamente'),
          duration: Duration(milliseconds: 4000),
          backgroundColor: Color(0xFF41697D),
        ),
      );
    }
  } else {
    await gasto.add({
      'uid': uid,
      'perfil': perfil,
      'tipo': tipo,
      'monto': monto,
      'fecha': fecha
    });
    context.pushNamed("InicioGastos");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('El gasto fue agregado correctamente'),
        duration: Duration(milliseconds: 4000),
        backgroundColor: Color(0xFF41697D),
      ),
    );
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
