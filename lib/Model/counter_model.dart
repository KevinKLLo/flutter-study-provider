import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int count = 0;

  void addCount() {
    count++;
    notifyListeners();
  }

  void resetCount() {
    count = 0;
    notifyListeners();
  }
}
