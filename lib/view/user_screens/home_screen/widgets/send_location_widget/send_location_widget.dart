// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/color_constants.dart';

class SendLocationWidget extends StatelessWidget {
  const SendLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalSendLocation(context),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: ColorConstants.primaryPink,
          title: Text("Send Location"),
          titleTextStyle: TextStyle(
              color: ColorConstants.primaryWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18),
          subtitle: Text("Share your location"),
          subtitleTextStyle:
              TextStyle(color: ColorConstants.primaryWhite, fontSize: 15),
          trailing: Icon(Icons.location_on,
              color: ColorConstants.primaryWhite, size: 30),
        ),
      ),
    );
  }

  showModalSendLocation(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height / 1.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
          );
        });
  }
}
