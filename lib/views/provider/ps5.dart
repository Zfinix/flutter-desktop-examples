import 'package:flutter/material.dart';

class Ps5VM extends ChangeNotifier {
  bool _dark = false;
  bool get dark => _dark;

  set dark(bool val) {
    _dark = val;
    notifyListeners();
  }
}
