// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_safety_app/controller/bottom_navigation_controller.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/view/user_screens/chat_screen/chat_screen.dart';
import 'package:women_safety_app/view/user_screens/contact_screen/contact_screen.dart';
import 'package:women_safety_app/view/user_screens/home_screen/home_screen.dart';
import 'package:women_safety_app/view/user_screens/profile_screen/profile_screen.dart';
import 'package:women_safety_app/view/user_screens/review_screen/review_screen.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  List<Widget> pages = [
    HomeScreen(),
    ContactScreen(),
    ChatScreen(),
    ProfileScreen(),
    ReviewScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final bottomNavigationState = context.watch<BottomNavigationController>();

    return Scaffold(
      body: pages[bottomNavigationState.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ColorConstants.primaryPink,
          selectedIconTheme: IconThemeData(size: 35),
          type: BottomNavigationBarType.fixed,
          currentIndex: bottomNavigationState.currentIndex,
          onTap: (value) {
            context.read<BottomNavigationController>().onTapped(value);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.contacts), label: "Contacts"),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble), label: "Chats"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.reviews), label: "Review")
          ]),
    );
  }
}
