import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';

class RegisterScreenController with ChangeNotifier {
  bool isPasswordShown = true;

  showPassword() {
    isPasswordShown = !isPasswordShown;
    notifyListeners();
  }

  progressIndicator(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
            child: CircularProgressIndicator(
                backgroundColor: ColorConstants.primaryPink, strokeWidth: 4)));
    notifyListeners();
  }
}
