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

  bool _showGoogleSignIn = false;
  bool get showGoogleSignIn => _showGoogleSignIn;
  set showGoogleSignIn(bool value) {
    _showGoogleSignIn = value;
  }
}
