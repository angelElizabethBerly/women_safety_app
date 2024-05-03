// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/view/login_screen/login_screen.dart';
import 'package:women_safety_app/view/register_user_screen/register_user_screen.dart';

class RegisterOptionScreen extends StatefulWidget {
  const RegisterOptionScreen({super.key});

  @override
  State<RegisterOptionScreen> createState() => _RegisterOptionScreenState();
}

class _RegisterOptionScreenState extends State<RegisterOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryPeach,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
              child: Text(
            "Choose Your Role",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          )),
          SizedBox(height: 30),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterUserScreen()));
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: ColorConstants.primaryWhite,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 5)),
                child: Center(
                  child: Text(
                    "User",
                    style: TextStyle(fontSize: 25),
                  ),
                )),
          ),
          SizedBox(height: 20),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  color: ColorConstants.primaryWhite,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 5)),
              child: Center(
                child: Text(
                  "Admin",
                  style: TextStyle(fontSize: 25),
                ),
              )),
          SizedBox(height: 40),
          Row(
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
                    "Log in",
                    style: TextStyle(
                        fontSize: 15, color: ColorConstants.primaryBlack),
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
