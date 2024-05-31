// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';

class HospitalNearMeWidget extends StatelessWidget {
  const HospitalNearMeWidget({super.key, required this.openMapFunction});
  final Function? openMapFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            openMapFunction!("hospitals near me");
          },
          child: Card(
            elevation: 10,
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: SizedBox(
              height: 60,
              width: 60,
              child: Center(
                  child: Icon(Icons.local_hospital,
                      color: ColorConstants.primaryPink, size: 35)),
            ),
          ),
        ),
        Text("Hospital")
      ],
    );
  }
}
