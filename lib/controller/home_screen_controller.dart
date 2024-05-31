import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController with ChangeNotifier {
  int quoteIndex = 0;

  getRandomQuote() {
    Random random = Random();
    quoteIndex = random.nextInt(31);
    notifyListeners();
  }

  callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  Future<void> openMap(String location) async {
    final permission = await Permission.location.status.isGranted;
    print(permission.toString());
    if (permission != true) {
      await Permission.location.request();
    } else {
      String googleUrl = "https://www.google.com/maps/search/$location";
      final Uri url = Uri.parse(googleUrl);
      try {
        await launchUrl(url);
      } catch (e) {
        Fluttertoast.showToast(msg: "Something went wrong");
      }
    }
    if (await Permission.location.status.isPermanentlyDenied) {
      openAppSettings();
    }
  }
}
