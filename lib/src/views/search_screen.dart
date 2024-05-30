import 'package:flutter/material.dart';
import 'package:food_focus/src/models/food_item.dart';
import 'package:geolocator/geolocator.dart';


// StatefulWidget to create a dynamic search screen.
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // Creating state for this screen.
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  // Asynchronous function to handle location permission from the user.
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled on the device.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Inform the user if location services are disabled.
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    // Check the current location permission status.
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request permission if previously denied.
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Show a snackbar if permission is denied.
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    // Handle the case where the user has permanently denied location permissions.
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    // Return true if all permissions checks are passed.
    return true;
  }

  // List to display filtered search results.
  List<FoodItem> displayList = List.from(foods);

  // Function to update the search results based on the user's input.
  void updateList(String value) {
    // Filtering the food list based on the input string.
    setState(() {
      displayList = foods
          .where((element) =>
              element.mealName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
          Image.asset('assets/images/food_focus_logo.png', width: 40, height: 40),
          const SizedBox(width: 10),    
          const Text("Food Focus", style: TextStyle(color: Colors.green)), ]
        ),
        backgroundColor: Colors.white,
        elevation: 0.0
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              // Text field for user input to search food items.
              TextField(
                canRequestFocus: true,
                keyboardType: TextInputType.name,
                onChanged: (value) => updateList(value),
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: "eg. chicken",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              // List view to display search results.
              Expanded(
                child: ListView.builder(
                  itemCount: displayList.length,
                  itemBuilder: (context, index) => FoodItem(
                    mealName: displayList[index].mealName,
                    mealImagePath: displayList[index].mealImagePath,
                    nutritionFacts: displayList[index].nutritionFacts,
                  ),
                )),
              ]),
        ),
      );
  }
}
