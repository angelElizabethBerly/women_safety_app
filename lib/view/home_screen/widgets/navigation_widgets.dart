// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_safety_app/controller/home_screen_controller.dart';
import 'package:women_safety_app/view/home_screen/widgets/near_me_widgets/hospital_near_me_widget.dart';
import 'package:women_safety_app/view/home_screen/widgets/near_me_widgets/pharmacy_near_me_widget.dart';
import 'package:women_safety_app/view/home_screen/widgets/near_me_widgets/police_near_me_widget.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PoliceNearMeWidget(
              openMapFunction: context.read<HomeScreenController>().openMap),
          HospitalNearMeWidget(
              openMapFunction: context.read<HomeScreenController>().openMap),
          PharmacyNearMeWidget(
              openMapFunction: context.read<HomeScreenController>().openMap)
        ],
      ),
    );
  }
}
