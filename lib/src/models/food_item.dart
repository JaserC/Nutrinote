import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  final String mealName;
  final String mealImagePath;
  final List<String>? nutritionFacts;

  const FoodItem({
    required this.mealName,
    required this.mealImagePath,
    this.nutritionFacts,
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
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(width: 20,),
            Image.asset(
                mealImagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
            ),
            Container(width: 20),
            Text(
            mealName,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),]
        ),
      ),
    );
  }
}

class MealDetailScreen extends StatelessWidget {
  final String mealName;
  final String mealImagePath;
  final List<String>? nutritionFacts;

  const MealDetailScreen({
    required this.mealName,
    required this.mealImagePath,
    this.nutritionFacts,
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
                mealImagePath,
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
          
          ],
        ),
      ),
    );
  }
}


List<FoodItem> foods = [
    FoodItem(mealName: 'Chicken',mealImagePath: 'assets/images/chicken.jpeg'),
    FoodItem(mealName: 'Apple',mealImagePath: 'assets/images/apple.jpeg'),
    FoodItem(mealName: 'Carrot',mealImagePath: 'assets/images/carrot.jpeg'),
    FoodItem(mealName: 'Salmon',mealImagePath: 'assets/images/salmon.jpeg'),
    FoodItem(mealName: 'Egg',mealImagePath: 'assets/images/egg.jpeg'),
    FoodItem(mealName: 'Almond',mealImagePath: 'assets/images/almond.jpeg'),
    FoodItem(mealName: 'Quinoa',mealImagePath: 'assets/images/quinoa.jpeg'),
    FoodItem(mealName: 'Spinach',mealImagePath: 'assets/images/spinach.jpeg'),
    FoodItem(mealName: 'Tomato',mealImagePath: 'assets/images/tomato.jpeg'),
    FoodItem(mealName: 'Brown Rice',mealImagePath: 'assets/images/brown rice.jpeg'),
    FoodItem(mealName: 'White Rice',mealImagePath: 'assets/images/white rice.jpeg'),
    FoodItem(mealName: 'Sweet Potato',mealImagePath: 'assets/images/sweet potato.jpeg'),
    // FoodItem(mealName: 'Baked Chicken Thighs',mealImagePath: 'lib/src/images/bakedchickenthighs.jpg'),
    // FoodItem(mealName: 'Chicken Fajitas',mealImagePath: 'lib/src/images/chickenfajitas.jpg'),
    // FoodItem(mealName: 'Creamy Garlic Chicken',mealImagePath: 'lib/src/images/creamygarlicchicken.jpg'),
    // FoodItem(mealName: 'Smoked Salmon Salad',mealImagePath: 'lib/src/images/smokedsalmonsalad.jpg'),
    // FoodItem(mealName: 'Tofu Stirfry',mealImagePath: 'lib/src/images/tofustirfry.jpg'),
    
    // FoodItem('Avocado'),
    // FoodItem('Blueberry'),
    // FoodItem('Greek Yogurt'),
    // FoodItem('Oatmeal'),
    // FoodItem('Lentil'),
    // FoodItem('Chickpea'),
    // FoodItem('Tofu'),
    // FoodItem('Kale'),
    // FoodItem('Strawberrie'),
    // FoodItem('Bell Pepper'),
    // FoodItem('Orange'),
    // FoodItem('Tuna'),
    // FoodItem('Walnut'),
    // FoodItem('Whole Wheat Bread'),
    // FoodItem('Mushroom'),
    // FoodItem('Cucumber'),
    // FoodItem('Cheese'),
  ];