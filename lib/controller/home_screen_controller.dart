import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreenController with ChangeNotifier {
  int quoteIndex = 0;

  getRandomQuote() {
    Random random = Random();
    quoteIndex = random.nextInt(31);
    notifyListeners();
  }
}
