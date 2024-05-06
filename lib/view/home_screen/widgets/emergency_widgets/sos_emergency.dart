// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/utils/image_constants.dart';

class SosEmergencyWidget extends StatelessWidget {
  const SosEmergencyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorConstants.primaryBlue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstants.sosButton, scale: 2),
          Text(
            "Send an SOS Signal",
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
