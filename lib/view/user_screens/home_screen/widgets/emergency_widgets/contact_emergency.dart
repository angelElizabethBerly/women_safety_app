// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_safety_app/controller/home_screen_controller.dart';
import 'package:women_safety_app/utils/color_constants.dart';

class EmergencyContactWidget extends StatelessWidget {
  const EmergencyContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeScreenController>().callNumber('919019030661');
      },
      child: Container(
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
            Icon(Icons.contact_emergency,
                size: 70, color: ColorConstants.primaryWhite),
            SizedBox(height: 10),
            Text(
              "Call Emergency Contact",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorConstants.primaryWhite,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
