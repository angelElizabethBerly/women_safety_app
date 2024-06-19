// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_safety_app/controller/add_contact_screen_controller.dart';
import 'package:women_safety_app/controller/bottom_navigation_controller.dart';
import 'package:women_safety_app/controller/contact_screen_controller.dart';
import 'package:women_safety_app/controller/home_screen_controller.dart';
import 'package:women_safety_app/controller/login_screen_controller.dart';
import 'package:women_safety_app/controller/register_screen_controller.dart';
import 'package:women_safety_app/firebase_options.dart';
import 'package:women_safety_app/utils/my_shared_preference.dart';
import 'package:women_safety_app/view/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MySharedPreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeScreenController()),
          ChangeNotifierProvider(create: (context) => LoginScreenController()),
          ChangeNotifierProvider(
              create: (context) => RegisterScreenController()),
          ChangeNotifierProvider(
              create: (context) => BottomNavigationController()),
          ChangeNotifierProvider(
              create: (context) => ContactScreenController()),
          ChangeNotifierProvider(
              create: (context) => AddContactScreenController()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: SplashScreen()));
  }
}
