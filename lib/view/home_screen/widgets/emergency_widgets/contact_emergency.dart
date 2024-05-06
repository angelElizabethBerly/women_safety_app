// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';

class EmergencyContactWidget extends StatelessWidget {
  const EmergencyContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
            ColorConstants.primaryBlue,
            ColorConstants.primaryPink
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.contact_emergency,
              size: 80, color: ColorConstants.primaryWhite),
          SizedBox(height: 10),
          Text(
            "Call Emergency Contact",
            textAlign: TextAlign.center,
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
