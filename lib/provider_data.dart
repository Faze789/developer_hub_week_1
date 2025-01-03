import 'package:flutter/material.dart';

class provider_data extends ChangeNotifier {
  bool like = false;

  void change() {
    if (like == false) {
      like = true;
    } else {
      like = false;
    }
    notifyListeners();
  }

  void increment() {
    notifyListeners();
  }
}
