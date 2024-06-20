import 'dart:math';

import 'package:background_sms/background_sms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController with ChangeNotifier {
  int quoteIndex = 0;
  Position? currentPosition;
  String? currentAddress;
  LocationPermission? permission;

  getRandomQuote() {
    Random random = Random();
    quoteIndex = random.nextInt(31);
    notifyListeners();
  }

  callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  Future<void> openMap(String location) async {
    String googleUrl = "https://www.google.com/maps/search/$location";
    final Uri url = Uri.parse(googleUrl);
    try {
      await launchUrl(url);
    } catch (e) {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }

  getPermission() async {
    return await [Permission.sms].request();
  }

  isPermissionGranted() async {
    return await Permission.sms.status.isGranted;
  }

  sendSms(String phoneNumber, String message, {int? simSlot}) async {
    await BackgroundSms.sendMessage(
            phoneNumber: phoneNumber, message: message, simSlot: simSlot)
        .then(
      (SmsStatus status) {
        if (status == 'sent') {
          Fluttertoast.showToast(msg: "Sent");
        } else {
          Fluttertoast.showToast(msg: "Failed");
        }
      },
    );
  }

  getCurrentLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      Fluttertoast.showToast(msg: "Location permission granted");

      if (permission == LocationPermission.deniedForever) {
        Fluttertoast.showToast(msg: "Location permission permanently denied");
      }
    }
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
            forceAndroidLocationManager: true)
        .then((Position position) {
      currentPosition = position;
      getAddressFromLatLong();
      notifyListeners();
    }).catchError((e) {
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  getAddressFromLatLong() async {
    try {
      List<Placemark>? placemarks = await placemarkFromCoordinates(
          currentPosition!.latitude, currentPosition!.longitude);
      Placemark place = placemarks[0];
      currentAddress = "${place.locality},${place.postalCode},${place.street}";
      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
