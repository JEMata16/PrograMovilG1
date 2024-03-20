import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _familiares = [];
  List<String> get familiares => _familiares;
  set familiares(List<String> value) {
    _familiares = value;
  }

  void addToFamiliares(String value) {
    _familiares.add(value);
  }

  void removeFromFamiliares(String value) {
    _familiares.remove(value);
  }

  void removeAtIndexFromFamiliares(int index) {
    _familiares.removeAt(index);
  }

  void updateFamiliaresAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _familiares[index] = updateFn(_familiares[index]);
  }

  void insertAtIndexInFamiliares(int index, String value) {
    _familiares.insert(index, value);
  }
}
