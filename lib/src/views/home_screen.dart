import 'package:flutter/material.dart';
import 'package:food_focus/src/views/meal_detail_screen.dart';

// Stateless widget for HomeScreen which displays featured and recommended meals.
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Sample data for Featured Meals tiles
  final List<Map<String, dynamic>> featuredMeals = [
    {
      "name": "Lemon Herb Chicken",
      "image": "assets/images/lemonherbchicken.jpg",
      "nutrition": ["Calories: 250", "Protein: 25g", "Carbs: 10g"],
    },
    {
      "name": "Smoked Salmon Salad",
      "image": "assets/images/smokedsalmonsalad.jpg",
      "nutrition": ["Calories: 200", "Protein: 20g", "Carbs: 5g"],
    },
    {
      "name": "Tofu Stir Fry",
      "image": "assets/images/tofustirfry.jpg",
      "nutrition": ["Calories: 300", "Protein: 15g", "Carbs: 20g"],
    },
    {
      "name": "Vegetable Curry",
      "image": 'assets/images/vegetablecurry.jpeg',
      "nutrition": ["Calories: 300", "Protein: 8g", "Carbs: 45g"],
    },
    {
      "name": "Beef Stir Fry",
      "image": 'assets/images/beefstirfry.jpeg',
      "nutrition": ["Calories: 350", "Protein: 30g", "Carbs: 20g"],
    },
    {
      "name": "Stuffed Bell Peppers",
      "image": 'assets/images/stuffedbellpeppers.jpeg',
      "nutrition": ["Calories: 320", "Protein: 20g", "Carbs: 30g"],
    },
  ];

  // Sample Data for Recommended Meals tiles
  final List<Map<String, dynamic>> recommendedMeals = [
    {
      "name": "Creamy Garlic Chicken",
      "image": "assets/images/creamygarlicchicken.jpg",
      "nutrition": ["Calories: 350", "Protein: 30g", "Carbs: 15g"],
    },
    {
      "name": "Chicken Fajitas",
      "image": "assets/images/chickenfajitas.jpg",
      "nutrition": ["Calories: 400", "Protein: 35g", "Carbs: 20g"],
    },
    {
      "name": "Baked Chicken Thighs",
      "image": "assets/images/bakedchickenthighs.jpg",
      "nutrition": ["Calories: 450", "Protein: 40g", "Carbs: 25g"],
    },
    {
      "name": "Vietnamese Beef Pho",
      "image": 'assets/images/beefpho.jpg',
      "nutrition": ["Calories: 215", "Protein: 15g", "Carbs: 25.2g"],
    },
    {
      "name": "Turkey Meatballs",
      "image": 'assets/images/turkeymeatballs.jpeg',
      "nutrition": ["Calories: 280", "Protein: 24g", "Carbs: 12g"],
    },
    {
      "name": "Grilled Shrimp Skewers",
      "image": 'assets/images/grilledshrimpskewers.jpeg',
      "nutrition": ["Calories: 220", "Protein: 25g", "Carbs: 10g"],
    },
  ];

  // Home screen interface with logo, title, and food tiles
  // Semantics included for accessability
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Semantics(
          label: 'Food Focus Logo and Title',
          child: Row(
            children: [
              Image.asset('assets/images/food_focus_logo.png',
                  width: 40, height: 40),
              const SizedBox(width: 10),
              const Text("Food Focus", style: TextStyle(color: Colors.green)),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Semantics(
                label: 'Welcome Back Text',
                child: const Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                ),
              ),
              const SizedBox(height: 10),
              // Section for Featured Meals heading.
              Semantics(
                label: 'Featured Meals Heading',
                child: const Text(
                  'Featured Meals',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              // Scrollable list to display featured meals horizontally.
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredMeals.length,
                  itemBuilder: (context, index) {
                    return MealTile(
                      mealName: featuredMeals[index]['name']!,
                      mealImage: featuredMeals[index]['image']!,
                      nutritionFacts: featuredMeals[index]['nutrition']!,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Semantics(
                label: 'Recommended Meals Heading',
                child: const Text(
                  'Recommended Meals',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
              // Scrollable list to display recommended meals horizontally.
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedMeals.length,
                  itemBuilder: (context, index) {
                    return MealTile(
                      mealName: recommendedMeals[index]['name']!,
                      mealImage: recommendedMeals[index]['image']!,
                      nutritionFacts: recommendedMeals[index]['nutrition']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// MealTile is a reusable widget to display individual meal information.
class MealTile extends StatelessWidget {
  final String mealName;
  final String mealImage;
  final List<String> nutritionFacts;

  // Constructor with required parameters for meal name, image, and nutrition facts.
  const MealTile({
    required this.mealName,
    required this.mealImage,
    required this.nutritionFacts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Tapping on the tile navigates to the screen with meal details (from food_item.dart)
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealDetailScreen(
              mealName: mealName,
              mealImagePath: mealImage,
              nutritionFacts: nutritionFacts,
            ),
          ),
        );
      },
      child: Semantics(
        label: 'Meal tile for $mealName',
        hint: 'Tap to view details',
        child: Column(
          children: [
            // Meal image displayed with rounded corners.
            Container(
              width: 150,
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green[100],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  mealImage,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            // Meal name displayed below the image.
            Semantics(
              label: 'Meal name $mealName',
              child: Text(
                mealName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}