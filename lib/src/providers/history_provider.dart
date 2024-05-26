import 'package:flutter/material.dart';
import 'package:food_focus/src/models/food_item.dart';

class HistoryProvider extends ChangeNotifier {
  final List<PreviousItem> _pastFoods;

  HistoryProvider() : _pastFoods = [];


  List<PreviousItem> get pastFoods => _pastFoods;

  // Add a new food.
  add(FoodItem item) {
    _pastFoods.add(PreviousItem(mealName: item.mealName, mealImagePath: item.mealImagePath, nutritionFacts: item.nutritionFacts, dateTime: DateTime.now()));
    notifyListeners();
  }
  
}
