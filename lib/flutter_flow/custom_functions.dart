import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double totalGastos() {
  double total = 0;

  FirebaseFirestore.instance
      .collection('gastos')
      .where('perfil', isEqualTo: 'Personal')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      total += (doc['monto'] ?? 0) as double;
    });
  }).catchError((error) {
    print('Error al obtener los gastos: $error');
  });

  return total;
}

double totalIngresos() {
  List<double> ingresos = [];
  double total = 0;
  for (double add in ingresos) {
    total += add;
  }
  return total;
}

double? gastosPorPerfil(String? idPerfil) {
  double total = 0;

  FirebaseFirestore.instance
      .collection('gastos')
      .where('perfil', isEqualTo: idPerfil)
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      total += (doc['monto'] ?? 0) as double;
    });
  }).catchError((error) {
    print('Error al obtener los gastos: $error');
  });

  return total;
}
