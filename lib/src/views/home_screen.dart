import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Sample data for meals
  final List<Map<String, dynamic>> featuredMeals = [
    {
      "name": "Lemon Herb Chicken",
      "image": "assets/images/emonherbchicken.jpg",
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
  ];

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.food_bank, color: Colors.green, size: 40),
            SizedBox(width: 20),
            Text("Food Focus", style: TextStyle(color: Colors.green)),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Featured',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,  // Adjusted height to fit meal name only
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
            const Text(
              'Recommended',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,  // Adjusted height to fit meal name only
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
    );
  }
}

class MealTile extends StatelessWidget {
  final String mealName;
  final String mealImage;
  final List<String> nutritionFacts;

  const MealTile({
    required this.mealName,
    required this.mealImage,
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
              mealImage: mealImage,
              nutritionFacts: nutritionFacts,
            ),
          ),
        );
      },
      child: Container(
        width: 150,  // Adjusted width to better display the meal name
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.green[100],
        ),
        child: Center(
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
      ),
    );
  }
}

class MealDetailScreen extends StatelessWidget {
  final String mealName;
  final String mealImage;
  final List<String> nutritionFacts;

  const MealDetailScreen({
    required this.mealName,
    required this.mealImage,
    required this.nutritionFacts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                mealImage,
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              mealName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nutrition Facts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...nutritionFacts.map((fact) => Text(
              fact,
              style: const TextStyle(fontSize: 16),
            )).toList(),
          ],
        ),
      ),
    );
  }
}
