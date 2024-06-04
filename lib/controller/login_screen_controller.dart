import 'package:flutter/material.dart';

class LoginScreenController with ChangeNotifier {
  bool isPasswordShown = true;

  showPassword() {
    isPasswordShown = !isPasswordShown;
    notifyListeners();
  }
}
