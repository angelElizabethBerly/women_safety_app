import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_safety_app/model/user_model.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/view/user_screens/login_screen/login_screen.dart';

class RegisterScreenController with ChangeNotifier {
  bool isPasswordShown = true;
  bool isConfirmPasswordShown = true;

  bool isLoading = false;

  showPassword() {
    isPasswordShown = !isPasswordShown;
    notifyListeners();
  }

  showConfirmPassword() {
    isConfirmPasswordShown = !isConfirmPasswordShown;
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

  onRegister(BuildContext context,
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String emergEmail,
      required String type}) async {
    try {
      isLoading = true;
      notifyListeners();
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        final v = userCredential.user!.uid;
        DocumentReference<Map<String, dynamic>> db =
            FirebaseFirestore.instance.collection('users').doc(v);
        final user = UserModel(
            name: name,
            phone: phone,
            userEmail: email,
            emergEmail: emergEmail,
            id: v,
            type: type);
        final userRegisterData = user.toJson();
        await db.set(userRegisterData).whenComplete(
          () {
            isLoading = false;
            notifyListeners();

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Registration complete"),
                backgroundColor: ColorConstants.darkPink));
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        context
            .read<RegisterScreenController>()
            .dialogBox(context, e.toString());
        isLoading = false;
        notifyListeners();
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        context
            .read<RegisterScreenController>()
            .dialogBox(context, e.toString());
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      print(e);
      context.read<RegisterScreenController>().dialogBox(context, e.toString());
      isLoading = false;
      notifyListeners();
    }
  }
}
