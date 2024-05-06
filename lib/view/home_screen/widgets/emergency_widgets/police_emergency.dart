// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';

class PoliceEmergencyWidget extends StatelessWidget {
  const PoliceEmergencyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            ColorConstants.primaryBlue,
            ColorConstants.primaryPink
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.local_police,
              size: 80, color: ColorConstants.primaryWhite),
          SizedBox(height: 10),
          Text(
            "Call Police",
            style: TextStyle(
                color: ColorConstants.primaryWhite,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
