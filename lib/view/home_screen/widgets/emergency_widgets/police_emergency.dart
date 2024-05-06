// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/utils/image_constants.dart';

class PoliceEmergencyWidget extends StatelessWidget {
  const PoliceEmergencyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorConstants.primaryGreen),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstants.policeIcon, scale: 1.5),
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
