import 'dart:html';

import 'package:flutter/material.dart';

import '../Pages/shopping_list/shopping_list_page.dart';

class ItemList with ChangeNotifier {
  List<ShoppingItem> foodItems = [
    ShoppingItem("Patate", false),
    ShoppingItem("Pizza", false),
    ShoppingItem("Pain", false),
  ];

  void removeItem(index) {
    foodItems.removeAt(index);
    notifyListeners();
  }

  void addItem(String s) {
    if (s != "" && s.length > 2) {
      foodItems.add(ShoppingItem(s, false));
      foodItems.sort((a, b) =>
          a.itemName.toLowerCase().compareTo(b.itemName.toLowerCase()));
      notifyListeners();
    }
  }

  void clearItems() {
    foodItems.clear();
    notifyListeners();
  }
}
