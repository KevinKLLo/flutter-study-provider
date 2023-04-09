import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int count = 0;

  void addCount() {
    count += 1;
    notifyListeners();
  }

  void resetCount() {}
}
