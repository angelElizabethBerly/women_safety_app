// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/view/home_screen/home_screen.dart';
import 'package:women_safety_app/view/login_screen/login_screen.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
              child: Text(
            "Register",
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
                hintText: "Enter Username",
                hintStyle: TextStyle(fontWeight: FontWeight.w300)),
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
                hintText: "Enter Password",
                hintStyle: TextStyle(fontWeight: FontWeight.w300)),
            obscureText: true,
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
                hintText: "Enter Your Name",
                hintStyle: TextStyle(fontWeight: FontWeight.w300)),
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
                hintText: "Enter Your Age",
                hintStyle: TextStyle(fontWeight: FontWeight.w300)),
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
              child: Text("Register",
                  style: TextStyle(color: ColorConstants.primaryWhite))),
        ]),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(fontSize: 15),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text(
                "Log In",
                style:
                    TextStyle(fontSize: 15, color: ColorConstants.primaryBlack),
              ))
        ],
      ),
    );
  }
}
