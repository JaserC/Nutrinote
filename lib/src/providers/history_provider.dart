import 'package:flutter/material.dart';
import 'package:food_focus/src/models/food_item.dart';
import 'package:geolocator/geolocator.dart';

class HistoryProvider extends ChangeNotifier {
  final List<PreviousItem> _pastFoods;

  HistoryProvider() : _pastFoods = [];


  List<PreviousItem> get pastFoods => _pastFoods;

  // Add a new food.
  Future<void> add(FoodItem item) async {
    try {
      Position position = await getCurrentLocation();
      _pastFoods.add(PreviousItem(
        mealName: item.mealName,
        mealImagePath: item.mealImagePath,
        nutritionFacts: item.nutritionFacts,
        dateTime: DateTime.now(),
        location: position,
      ));
      notifyListeners();
    } catch (e) {
      // Handle location fetch error
      print('Error fetching location: $e');
    }
  }

  // Method to get the current location
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
  
}
