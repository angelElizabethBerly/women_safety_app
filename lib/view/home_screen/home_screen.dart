// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_safety_app/controller/home_screen_controller.dart';
import 'package:women_safety_app/view/home_screen/widgets/custom_carousel.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/utils/women_database.dart';
import 'package:women_safety_app/view/home_screen/widgets/emergency_widgets/ambulance_emergency.dart';
import 'package:women_safety_app/view/home_screen/widgets/emergency_widgets/contact_emergency.dart';
import 'package:women_safety_app/view/home_screen/widgets/emergency_widgets/police_emergency.dart';
import 'package:women_safety_app/view/home_screen/widgets/emergency_widgets/sos_emergency.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeScreenController>().getRandomQuote();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenState = context.watch<HomeScreenController>();
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorConstants.primaryPink),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(),
                accountName: Text("Acc Name"),
                accountEmail: Text("Acc Email")),
            ListTile(leading: Icon(Icons.person), title: Text("Profile")),
            ListTile(leading: Icon(Icons.settings), title: Text("Settings")),
            ListTile(leading: Icon(Icons.book), title: Text("About")),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorConstants.primaryPink,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    WomenDatabase.womenQuotes[homeScreenState.quoteIndex],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorConstants.primaryWhite, fontSize: 16),
                  )),
              SizedBox(height: 10),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2),
                  children: [
                    SosEmergencyWidget(),
                    PoliceEmergencyWidget(),
                    AmbulanceEmergencyWidget(),
                    EmergencyContactWidget()
                  ],
                ),
              ),
              CustomCarousalWidget()
            ],
          ),
        ),
      ),
    );
  }
}
