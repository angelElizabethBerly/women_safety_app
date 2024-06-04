import 'package:flutter/material.dart';

class RegisterScreenController with ChangeNotifier {
  bool isPasswordShown = true;

  showPassword() {
    isPasswordShown = !isPasswordShown;
    notifyListeners();
  }
}
