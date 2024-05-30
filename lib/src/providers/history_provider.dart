import 'package:flutter/material.dart';
import 'package:food_focus/src/models/food_item.dart';
import 'package:food_focus/src/utils/uuid_generator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

class HistoryProvider extends ChangeNotifier {
  final Box<PreviousItem> _pastFoods;
  
  HistoryProvider(Box<PreviousItem> box) : _pastFoods = Hive.box<PreviousItem>('previous_items');


  List<PreviousItem> get pastFoods => List.from(_pastFoods.values);

  // Add a new food.
  Future<void> add(FoodItem item) async {
    UUIDString uuid = UUIDMaker.generateUUID();
    try {
      String position = await getCurrentLocation();
      _pastFoods.put(uuid, PreviousItem(
        mealName: item.mealName,
        mealImagePath: item.mealImagePath,
        nutritionFacts: item.nutritionFacts,
        dateTime: DateTime.now(),
        location: position,
        uuid: uuid,
      ));
      notifyListeners();
    } catch (e) {
      // Handle location fetch error
      _pastFoods.put(uuid, PreviousItem(
        mealName: item.mealName,
        mealImagePath: item.mealImagePath,
        nutritionFacts: item.nutritionFacts,
        dateTime: DateTime.now(),
        uuid: uuid,
      ));
      notifyListeners();
    }
  }

  // Method to get the current location
  Future<String> getCurrentLocation() async {
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
    
    Position position = await Geolocator.getCurrentPosition();

    String? address = await _getAddressFromLatLng(position);

    return address ?? 'Unknown';
  }

  Future<String?> _getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return "${place.name}, ${place.locality}, ${place.administrativeArea}";
      }
    } catch (e) {
      var logger = Logger();
      logger.w("Address unavailable");
    }
    return null;
  }
  
}
