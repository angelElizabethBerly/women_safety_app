import 'package:flutter/material.dart';

class BottomNavigationController with ChangeNotifier {
  int currentIndex = 0;

  onTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
