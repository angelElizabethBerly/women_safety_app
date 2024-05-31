// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';

class SosEmergencyWidget extends StatelessWidget {
  const SosEmergencyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 6,
                color: ColorConstants.primaryBlack,
                offset: Offset(0, 2))
          ],
          color: ColorConstants.primaryPink,
          borderRadius: BorderRadius.circular(50)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sos, size: 60, color: ColorConstants.primaryWhite),
          Text(
            "Send an SOS Signal",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorConstants.primaryWhite,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
