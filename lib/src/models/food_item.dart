import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_focus/src/utils/uuid_generator.dart';
import 'package:food_focus/src/views/meal_detail_screen.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'food_item.g.dart';


// A StatelessWidget that represents a single food item in the search screen.
class FoodItem extends StatelessWidget {
  final String mealName;
  final String mealImagePath;
  final List<String> nutritionFacts;

  const FoodItem({
    required this.mealName,
    required this.mealImagePath,
    required this.nutritionFacts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealDetailScreen(
              mealName: mealName,
              mealImagePath: mealImagePath,
              nutritionFacts: nutritionFacts,
            ),
          ),
        );
      },
      child: Semantics(
        label: 'Search entry for $mealName',
        child: Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(children: [
            Container(
              width: 20,
            ),
            Container(
              padding: const EdgeInsets.all(4), // Border width
              decoration: BoxDecoration(
                  color: Colors.yellow[100], shape: BoxShape.circle),
              child: Semantics(
                label: '$mealName picture',
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(40), // Image radius
                    child: Image.asset(mealImagePath, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Container(width: 20),
            Text(
              mealName,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

// A HiveType annotated class for storing previous items with metadata.
@HiveType(typeId: 3, adapterName: "ItemAdapter")
class PreviousItem extends StatelessWidget {
  @HiveField(0)
  final String mealName;
  @HiveField(1)
  final String mealImagePath;
  @HiveField(2)
  final List<String> nutritionFacts;
  @HiveField(3)
  final DateTime dateTime;
  @HiveField(4)
  final String? location;
  @HiveField(5)
  final UUIDString uuid;

  const PreviousItem({
    required this.mealName,
    required this.mealImagePath,
    required this.nutritionFacts,
    required this.dateTime,
    this.location,
    required this.uuid,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Image mealPic = mealImagePath.startsWith('assets/')
        ? Image.asset(mealImagePath, fit: BoxFit.cover, height: 200)
        : Image.file(File(mealImagePath), fit: BoxFit.cover, height: 200);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealDetailScreen(
              mealName: mealName,
              mealImagePath: mealImagePath,
              nutritionFacts: nutritionFacts,
            ),
          ),
        );
      },
      child: Semantics(
        label: 'History entry for $mealName',
        child: Row(
          children: [
            Semantics(
              label: '$mealName picture',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(40), // Image radius
                  child: mealPic,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mealName,
                  style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                      textAlign: TextAlign.left,
                ),
                Text(
                  _formatDateTime(dateTime),
                  style: TextStyle(color: Colors.green[300], fontSize: 12),
                  textAlign: TextAlign.left,
                ),
                Text(
                  (location != null) ? location.toString() : 'No Location',
                  style: TextStyle(color: Colors.green[300], fontSize: 10),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //Formats date and time YEAR_ABBR_MONTH_WEEKDAY_DAY eg (Wed, May 29, 2024 2:48PM)
  _formatDateTime(DateTime when) {
    return DateFormat.yMMMEd('en_US').add_jm().format(when);
  }
}


//Hard coded items for search screen
List<FoodItem> foods = [
  const FoodItem(
      mealName: 'Baked Chicken Thighs',
      mealImagePath: 'assets/images/bakedchickenthighs.jpg',
      nutritionFacts: ["Calories: 450", "Protein: 40g", "Carbs: 25g"]),
  const FoodItem(
      mealName: 'Chicken Fajitas',
      mealImagePath: 'assets/images/chickenfajitas.jpg',
      nutritionFacts: ["Calories: 400", "Protein: 35g", "Carbs: 20g"]),
  const FoodItem(
      mealName: 'Creamy Garlic Chicken',
      mealImagePath: 'assets/images/creamygarlicchicken.jpg',
      nutritionFacts: ["Calories: 350", "Protein: 30g", "Carbs: 15g"]),
  const FoodItem(
      mealName: 'Smoked Salmon Salad',
      mealImagePath: 'assets/images/smokedsalmonsalad.jpg',
      nutritionFacts: ["Calories: 200", "Protein: 20g", "Carbs: 5g"]),
  const FoodItem(
      mealName: 'Tofu Stirfry',
      mealImagePath: 'assets/images/tofustirfry.jpg',
      nutritionFacts: ["Calories: 300", "Protein: 15g", "Carbs: 20g"]),
  const FoodItem(
      mealName: 'Lemon Herb Chicken',
      mealImagePath: 'assets/images/lemonherbchicken.jpg',
      nutritionFacts: ["Calories: 250", "Protein: 25g", "Carbs: 10g"]),
  const FoodItem(
      mealName: 'Grilled Shrimp Skewers',
      mealImagePath: 'assets/images/grilledshrimpskewers.jpeg',
      nutritionFacts: ["Calories: 220", "Protein: 25g", "Carbs: 10g"]),
  const FoodItem(
      mealName: 'Beef Stir Fry',
      mealImagePath: 'assets/images/beefstirfry.jpeg',
      nutritionFacts: ["Calories: 350", "Protein: 30g", "Carbs: 20g"]),
  const FoodItem(
      mealName: 'Turkey Meatballs',
      mealImagePath: 'assets/images/turkeymeatballs.jpeg',
      nutritionFacts: ["Calories: 280", "Protein: 24g", "Carbs: 12g"]),
  const FoodItem(
      mealName: 'Vegetable Curry',
      mealImagePath: 'assets/images/vegetablecurry.jpeg',
      nutritionFacts: ["Calories: 300", "Protein: 8g", "Carbs: 45g"]),
  const FoodItem(
      mealName: 'Stuffed Bell Peppers',
      mealImagePath: 'assets/images/stuffedbellpeppers.jpeg',
      nutritionFacts: ["Calories: 320", "Protein: 20g", "Carbs: 30g"]),
  const FoodItem(
      mealName: 'Chicken',
      mealImagePath: 'assets/images/chicken.jpeg',
      nutritionFacts: ["Calories: 335", "Protein: 30g", "Carbs: 0g"]),
  const FoodItem(
      mealName: 'Apple',
      mealImagePath: 'assets/images/apple.jpeg',
      nutritionFacts: ["Calories: 95", "Protein: 0.5g", "Carbs: 25g"]),
  const FoodItem(
      mealName: 'Carrot',
      mealImagePath: 'assets/images/carrot.jpeg',
      nutritionFacts: ["Calories: 25", "Protein: 0.6g", "Carbs: 6g"]),
  const FoodItem(
      mealName: 'Salmon',
      mealImagePath: 'assets/images/salmon.jpeg',
      nutritionFacts: ["Calories: 206", "Protein: 22g", "Carbs: 0g"]),
  const FoodItem(
      mealName: 'Egg',
      mealImagePath: 'assets/images/egg.jpeg',
      nutritionFacts: ["Calories: 78", "Protein: 6g", "Carbs: 0.6g"]),
  const FoodItem(
      mealName: 'Almond',
      mealImagePath: 'assets/images/almond.jpeg',
      nutritionFacts: ["Calories: 164", "Protein: 6g", "Carbs: 6g"]),
  const FoodItem(
      mealName: 'Quinoa',
      mealImagePath: 'assets/images/quinoa.jpeg',
      nutritionFacts: ["Calories: 222", "Protein: 8g", "Carbs: 39g"]),
  const FoodItem(
      mealName: 'Spinach',
      mealImagePath: 'assets/images/spinach.jpeg',
      nutritionFacts: ["Calories: 23", "Protein: 2.9g", "Carbs: 3.6g"]),
  const FoodItem(
      mealName: 'Tomato',
      mealImagePath: 'assets/images/tomato.jpeg',
      nutritionFacts: ["Calories: 22", "Protein: 1.1g", "Carbs: 4.8g"]),
  const FoodItem(
      mealName: 'Brown Rice',
      mealImagePath: 'assets/images/brownrice.jpeg',
      nutritionFacts: ["Calories: 215", "Protein: 5g", "Carbs: 45g"]),
  const FoodItem(
      mealName: 'White Rice',
      mealImagePath: 'assets/images/whiterice.jpeg',
      nutritionFacts: ["Calories: 205", "Protein: 4g", "Carbs: 45g"]),
  const FoodItem(
      mealName: 'Sweet Potato',
      mealImagePath: 'assets/images/sweetpotato.jpeg',
      nutritionFacts: ["Calories: 112", "Protein: 2g", "Carbs: 26g"]),
];
