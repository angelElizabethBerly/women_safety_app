// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/utils/image_constants.dart';
import 'package:women_safety_app/utils/my_shared_preference.dart';
import 'package:women_safety_app/view/guardian_screens/guardian_home_screen/guardian_home_screen.dart';
import 'package:women_safety_app/view/user_screens/home_screen/home_screen.dart';
import 'package:women_safety_app/view/user_screens/bottom_navigation/bottom_navigation_widget.dart';
import 'package:women_safety_app/view/user_screens/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MySharedPreference.getUserType() == 'user'
                    ? BottomNavWidget()
                    : MySharedPreference.getUserType() == 'guardian'
                        ? GuardianHomeScreen()
                        : LoginScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryPink,
      body: Center(
          child: Image.asset(
        ImageConstants.appLogo,
        scale: 0.5,
      )),
    );
  }
}
