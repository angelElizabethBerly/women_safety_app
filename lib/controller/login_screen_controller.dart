import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/utils/my_shared_preference.dart';
import 'package:women_safety_app/view/guardian_screens/guardian_home_screen/guardian_home_screen.dart';
import 'package:women_safety_app/view/user_screens/home_screen/home_screen.dart';

class LoginScreenController with ChangeNotifier {
  bool isPasswordShown = true;
  bool isLoading = false;

  showPassword() {
    isPasswordShown = !isPasswordShown;
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

  progressIndicator(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
            child: CircularProgressIndicator(
                strokeWidth: 7, color: ColorConstants.primaryPink)));
    notifyListeners();
  }

  onLogin(BuildContext context, String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        isLoading = false;
        notifyListeners();
        FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get()
            .then((value) {
          if (value['type'] == 'guardian') {
            print(value['type']);
            MySharedPreference.saveUserType('guardian');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => GuardianHomeScreen()));
          } else {
            print(value['type']);
            MySharedPreference.saveUserType('user');
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Succesfully logged in"),
            backgroundColor: ColorConstants.darkPink));
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        dialogBox(context, "No user found for that email");
        isLoading = false;
        notifyListeners();

        print("No user found for that email");
      } else if (e.code == 'wrong-password') {
        dialogBox(context, "Wrong password provided for that user");
        isLoading = false;
        notifyListeners();

        print("Wrong password provided for that user");
      } else {
        dialogBox(context, e.code);
        isLoading = false;
        notifyListeners();
      }
    }
  }
}
