import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(width: 20,),
            Container( 
                padding: const EdgeInsets.all(4), // Border width 
                decoration: BoxDecoration(color: Colors.yellow[100], shape: BoxShape.circle), 
                child: ClipOval( 
                    child: SizedBox.fromSize( 
                        size: const Size.fromRadius(40), // Image radius 
                        child: Image.asset(mealImagePath, fit: BoxFit.cover), 
                    ), 
                ), 
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

  compareTo(FoodItem b) {
    if (mealName.compareTo(b.mealName) == 1) {
      return 1;
    } else if (mealName.compareTo(b.mealName) == 0) {
      return 0;
    } else {
      return -1;
    }
  }
}

class MealDetailScreen extends StatelessWidget {
  final String mealName;
  final String mealImagePath;
  final List<String> nutritionFacts;

  const MealDetailScreen({
    required this.mealName,
    required this.mealImagePath,
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
              child: Image.asset(
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
            SizedBox(
                height: 30,
                child: Text(nutritionFacts[0]),
            ),
            Container(
                height: 30,
                child: Text(nutritionFacts[1]),
            ),
            SizedBox(
                height: 30,
                child: Text(nutritionFacts[2])
            )
          ],
        ),
      ),
    );
  }
}


List<FoodItem> foods = [
    const FoodItem(mealName: 'Baked Chicken Thighs', mealImagePath: 'assets/images/bakedchickenthighs.jpg', nutritionFacts: ["Calories: 450", "Protein: 40g", "Carbs: 25g"]),
    const FoodItem(mealName: 'Chicken Fajitas', mealImagePath: 'assets/images/chickenfajitas.jpg', nutritionFacts: ["Calories: 400", "Protein: 35g", "Carbs: 20g"]),
    const FoodItem(mealName: 'Creamy Garlic Chicken', mealImagePath: 'assets/images/creamygarlicchicken.jpg', nutritionFacts: ["Calories: 350", "Protein: 30g", "Carbs: 15g"]),
    const FoodItem(mealName: 'Smoked Salmon Salad', mealImagePath: 'assets/images/smokedsalmonsalad.jpg', nutritionFacts: ["Calories: 200", "Protein: 20g", "Carbs: 5g"]),
    const FoodItem(mealName: 'Tofu Stirfry', mealImagePath: 'assets/images/tofustirfry.jpg', nutritionFacts: ["Calories: 300", "Protein: 15g", "Carbs: 20g"]),
    const FoodItem(mealName: 'Lemon Herb Chicken', mealImagePath: 'assets/images/lemonherbchicken.jpg', nutritionFacts: ["Calories: 250", "Protein: 25g", "Carbs: 10g"]),
    const FoodItem(mealName: 'Chicken', mealImagePath: 'assets/images/chicken.jpeg', nutritionFacts: ["Calories: 335", "Protein: 30g", "Carbs: 0g"]),
    const FoodItem(mealName: 'Apple', mealImagePath: 'assets/images/apple.jpeg', nutritionFacts: ["Calories: 95", "Protein: 0.5g", "Carbs: 25g"]),
    const FoodItem(mealName: 'Carrot', mealImagePath: 'assets/images/carrot.jpeg', nutritionFacts: ["Calories: 25", "Protein: 0.6g", "Carbs: 6g"]),
    const FoodItem(mealName: 'Salmon', mealImagePath: 'assets/images/salmon.jpeg', nutritionFacts: ["Calories: 206", "Protein: 22g", "Carbs: 0g"]),
    const FoodItem(mealName: 'Egg', mealImagePath: 'assets/images/egg.jpeg', nutritionFacts: ["Calories: 78", "Protein: 6g", "Carbs: 0.6g"]),
    const FoodItem(mealName: 'Almond', mealImagePath: 'assets/images/almond.jpeg', nutritionFacts: ["Calories: 164", "Protein: 6g", "Carbs: 6g"]),
    const FoodItem(mealName: 'Quinoa', mealImagePath: 'assets/images/quinoa.jpeg', nutritionFacts: ["Calories: 222", "Protein: 8g", "Carbs: 39g"]),
    const FoodItem(mealName: 'Spinach', mealImagePath: 'assets/images/spinach.jpeg', nutritionFacts: ["Calories: 23", "Protein: 2.9g", "Carbs: 3.6g"]),
    const FoodItem(mealName: 'Tomato', mealImagePath: 'assets/images/tomato.jpeg', nutritionFacts: ["Calories: 22", "Protein: 1.1g", "Carbs: 4.8g"]),
    const FoodItem(mealName: 'Brown Rice', mealImagePath: 'assets/images/brown_rice.jpeg', nutritionFacts: ["Calories: 215", "Protein: 5g", "Carbs: 45g"]),
    const FoodItem(mealName: 'White Rice', mealImagePath: 'assets/images/white_rice.jpeg', nutritionFacts: ["Calories: 205", "Protein: 4g", "Carbs: 45g"]),
    const FoodItem(mealName: 'Sweet Potato', mealImagePath: 'assets/images/sweet_potato.jpeg', nutritionFacts: ["Calories: 112", "Protein: 2g", "Carbs: 26g"]),


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