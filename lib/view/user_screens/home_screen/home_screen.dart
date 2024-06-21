// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_safety_app/controller/home_screen_controller.dart';
import 'package:women_safety_app/view/user_screens/add_contact_screen/add_contact_screen.dart';
import 'package:women_safety_app/view/user_screens/home_screen/widgets/custom_carousel.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/utils/women_database.dart';
import 'package:women_safety_app/view/user_screens/home_screen/widgets/emergency_widgets/ambulance_emergency.dart';
import 'package:women_safety_app/view/user_screens/home_screen/widgets/emergency_widgets/contact_emergency.dart';
import 'package:women_safety_app/view/user_screens/home_screen/widgets/emergency_widgets/police_emergency.dart';
import 'package:women_safety_app/view/user_screens/home_screen/widgets/emergency_widgets/sos_emergency.dart';
import 'package:women_safety_app/view/user_screens/home_screen/widgets/navigation_widgets.dart';
import 'package:women_safety_app/view/user_screens/home_screen/widgets/send_location_widget/send_location_widget.dart';

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
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryPink,
        elevation: 2,
        shadowColor: ColorConstants.darkPink,
        title: Text(
          "SafeWomen",
          style: TextStyle(color: ColorConstants.primaryWhite),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddContactScreen()));
              },
              icon: Icon(Icons.contacts, color: ColorConstants.primaryWhite))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  WomenDatabase.womenQuotes[homeScreenState.quoteIndex],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 10),
                Divider(color: ColorConstants.darkPink),
                Text("EMERGENCY",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                        color: ColorConstants.darkPink)),
                Divider(color: ColorConstants.darkPink),
                SizedBox(height: 10),
                GridView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2),
                  children: [
                    // SosEmergencyWidget(),
                    PoliceEmergencyWidget(),
                    AmbulanceEmergencyWidget(),
                    EmergencyContactWidget()
                  ],
                ),
                SizedBox(height: 20),
                Divider(color: ColorConstants.darkPink),
                Text("NAVIGATION",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                        color: ColorConstants.darkPink)),
                Divider(color: ColorConstants.darkPink),
                SizedBox(height: 5),
                NavigationWidget(),
                SendLocationWidget(),
                SizedBox(height: 20),
                Text("ARTICLES",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                SizedBox(height: 5),
                CustomCarousalWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
