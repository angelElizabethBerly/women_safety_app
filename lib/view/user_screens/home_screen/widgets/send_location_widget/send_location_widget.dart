// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:women_safety_app/controller/home_screen_controller.dart';
import 'package:women_safety_app/global_widgets/primary_button.dart';
import 'package:women_safety_app/model/contact_model.dart';
import 'package:women_safety_app/utils/color_constants.dart';
import 'package:women_safety_app/utils/db_services.dart';

class SendLocationWidget extends StatefulWidget {
  const SendLocationWidget({super.key});

  @override
  State<SendLocationWidget> createState() => _SendLocationWidgetState();
}

class _SendLocationWidgetState extends State<SendLocationWidget> {
  @override
  void initState() {
    context.read<HomeScreenController>().getPermission();
    context.read<HomeScreenController>().getCurrentLocation();
    super.initState();
  }

  Position? currentPosition;
  String? currentAddress;

  @override
  Widget build(BuildContext context) {
    final sendLocationState = context.watch<HomeScreenController>();
    currentPosition = sendLocationState.currentPosition;
    currentAddress = sendLocationState.currentAddress;
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
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Send your Current Location to Emergency Contact",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center),
                  SizedBox(height: 10),
                  if (currentPosition != null) Text(currentAddress!),
                  PrimaryButtonWidget(
                      title: "Get Location",
                      onPressed: () {
                        context
                            .read<HomeScreenController>()
                            .getCurrentLocation();
                      }),
                  SizedBox(height: 10),
                  PrimaryButtonWidget(
                      title: "Send Alert",
                      onPressed: () async {
                        List<TruContact> contactList =
                            await DatabaseHelper().getContactList();
                        String recipients = "";
                        int i = 1;
                        for (TruContact contact in contactList) {
                          recipients += contact.number;
                          if (i != contactList.length) {
                            recipients += ";";
                            i++;
                          }
                        }
                        String messageBody =
                            "https://www.google.com/maps/search/?api=1&query=${currentPosition!.latitude}%2C${currentPosition!.longitude}. $currentAddress";
                        if (await context
                            .read<HomeScreenController>()
                            .isPermissionGranted()) {
                          contactList.forEach(
                            (element) {
                              context.read<HomeScreenController>().sendSms(
                                  "${element.number}",
                                  "I am in trouble, please reach out to me at $messageBody",
                                  simSlot: 1);
                            },
                          );
                        } else {
                          Fluttertoast.showToast(msg: "Something went wrong");
                        }
                      }),
                ],
              ),
            ),
          );
        });
  }
}
