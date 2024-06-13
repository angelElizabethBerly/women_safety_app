// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_safety_app/controller/login_screen_controller.dart';
import 'package:women_safety_app/global_widgets/custom_textfield.dart';
import 'package:women_safety_app/global_widgets/primary_button.dart';
import 'package:women_safety_app/global_widgets/secondary_button.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/utils/image_constants.dart';
import 'package:women_safety_app/view/register_user_screen/register_user_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final formData = Map<String, Object>();
  @override
  Widget build(BuildContext context) {
    final loginScreenState = context.watch<LoginScreenController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(ImageConstants.appLogo, height: 100, width: 100),
            SizedBox(height: 25),
            Center(
                child: Text(
              "LOGIN",
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 30,
                  color: ColorConstants.darkPink),
            )),
            SizedBox(height: 25),
            CustomTextFieldWidget(
                labelText: "Enter email",
                prefix: Icon(Icons.person, color: ColorConstants.darkPink),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                validate: (email) {
                  if (email!.isEmpty ||
                      email.length < 3 ||
                      !email.contains("@")) {
                    return "Enter valid email";
                  }
                  return null;
                },
                onSave: (email) {
                  formData["email"] = email ?? "";
                }),
            SizedBox(height: 20),
            CustomTextFieldWidget(
                labelText: "Enter password",
                prefix: Icon(Icons.key, color: ColorConstants.darkPink),
                isPassword: loginScreenState.isPasswordShown,
                suffix: IconButton(
                    onPressed: () {
                      context.read<LoginScreenController>().showPassword();
                    },
                    icon: loginScreenState.isPasswordShown
                        ? Icon(Icons.visibility_off,
                            color: ColorConstants.darkPink)
                        : Icon(Icons.visibility,
                            color: ColorConstants.darkPink)),
                validate: (password) {
                  if (password!.isEmpty || password.length < 7) {
                    return "Enter valid password";
                  }
                  return null;
                },
                onSave: (password) {
                  formData["password"] = password ?? "";
                }),
            SizedBox(height: 20),
            loginScreenState.isLoading
                ? CircularProgressIndicator()
                : PrimaryButtonWidget(
                    title: "Login",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await onSubmit();
                      }
                    }),
            Align(
                alignment: Alignment.centerRight,
                child: SecondaryButtonWidget(
                    title: "Forgot Password?", onPressed: () {}))
          ]),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(fontSize: 15),
          ),
          SecondaryButtonWidget(
              title: "Register",
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterUserScreen()));
              })
        ],
      ),
    );
  }

  onSubmit() async {
    formKey.currentState!.save();
    context.read<LoginScreenController>().onLogin(
        context, formData["email"].toString(), formData["password"].toString());
    print(formData["email"]);
    print(formData["password"]);
  }
}
