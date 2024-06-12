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
                strokeWidth: 7, color: ColorConstants.primaryPink)));
    notifyListeners();
  }

  dialogBox(BuildContext context, String text) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
              icon:
                  Icon(Icons.info, size: 35, color: ColorConstants.primaryPink),
            ));
    notifyListeners();
  }
}
