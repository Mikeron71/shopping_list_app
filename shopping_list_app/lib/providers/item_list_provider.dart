import 'package:flutter/material.dart';

class ItemList with ChangeNotifier {
  List<FoodItem> foodItems = [
    FoodItem("Bread", false),
    FoodItem("Coucou francis :)", false),
    FoodItem("Pizza", false),
    FoodItem("Potato", false),
  ];

  void removeItem(index) {
    foodItems.removeAt(index);
    notifyListeners();
  }

  void addItem(String s) {
    if (s != "" && s.length > 2) {
      foodItems.add(FoodItem(s, false));
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

class FoodItem {
  final String itemName;
  bool checked;

  FoodItem(this.itemName, this.checked);
}
