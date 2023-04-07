import 'dart:collection';

import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  /// UnmodifiableListView 是什麼？
  /// "get + =>" 可以理解成 computer_property
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  int get totalPrice => _items.length * 42;

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}

class Item {}
