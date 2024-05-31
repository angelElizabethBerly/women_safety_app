// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/view/home_screen/home_screen.dart';
import 'package:women_safety_app/view/register_option_screen/register_option_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
              child: Text(
            "Login",
            style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 30,
                color: ColorConstants.darkPink),
          )),
          SizedBox(height: 30),
          TextFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2, color: ColorConstants.primaryPink),
                    borderRadius: BorderRadius.circular(10)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3),
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: ColorConstants.primaryWhite,
                labelText: "Username",
                labelStyle: TextStyle(
                  color: ColorConstants.darkPink,
                  fontWeight: FontWeight.w200,
                )),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2, color: ColorConstants.primaryPink),
                    borderRadius: BorderRadius.circular(10)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3),
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: ColorConstants.primaryWhite,
                labelText: "Password",
                labelStyle: TextStyle(
                  color: ColorConstants.darkPink,
                  fontWeight: FontWeight.w200,
                )),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(ColorConstants.darkPink)),
              child: Text("Login",
                  style: TextStyle(color: ColorConstants.primaryWhite))),
        ]),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(fontSize: 15),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterOptionScreen()));
              },
              child: Text(
                "Register",
                style: TextStyle(fontSize: 15, color: ColorConstants.darkPink),
              ))
        ],
      ),
    );
  }
}
