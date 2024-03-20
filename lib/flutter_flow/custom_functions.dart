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

double sumarGastos() {
  double gasto = 0;
  double suma = 0;

  suma = suma + gasto;
  return suma;
}

double totalGastos() {
  List<double> gastos = [];
  double total = 0;
  for (double add in gastos) {
    total += add;
  }
  return total;
}

double sumarIngresos() {
  double ingreso = 0;
  double suma = 0;

  suma = suma + ingreso;
  return suma;
}

double totalIngresos() {
  List<double> ingresos = [];
  double total = 0;
  for (double add in ingresos) {
    total += add;
  }
  return total;
}
