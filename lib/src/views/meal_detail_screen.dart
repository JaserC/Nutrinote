import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_focus/src/models/food_item.dart';
import 'package:food_focus/src/providers/history_provider.dart';
import 'package:provider/provider.dart';

// Class to represent the detailed view of a meal, navigated to from other screens.
class MealDetailScreen extends StatelessWidget {
  final String mealName;
  final String mealImagePath;
  final List<String> nutritionFacts;

  // Constructor with required parameters.
  const MealDetailScreen({
    required this.mealName,
    required this.mealImagePath,
    required this.nutritionFacts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Image mealPic = mealImagePath.startsWith('assets/')
        ? Image.asset(mealImagePath, fit: BoxFit.cover, height: 300)
        : Image.file(File(mealImagePath), fit: BoxFit.cover, height: 300);
    return Consumer<HistoryProvider>(
        builder: (context, historyProvider, unchangingChild) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          // Interaction with history provider to add the meal to history.
            historyProvider.add(FoodItem(
                mealName: mealName,
                mealImagePath: mealImagePath,
                nutritionFacts: nutritionFacts));
          // Display a snackbar as confirmation of addition.
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Item Added!'),
              backgroundColor: Colors.green,
            ));
          },
          backgroundColor: Colors.greenAccent,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text(mealName),
        ),
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display the meal image at the top of the screen.
                Semantics(
                    label: '$mealPic picture', child: Center(child: mealPic)),
                const SizedBox(height: 20),
                // Display the meal name.
                Text(
                  mealName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
              // Heading for the nutrition facts section.
                const Text(
                  'Nutrition Facts',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
              // List each nutrition fact.
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: nutritionFacts
                      .map((fact) => SizedBox(
                            height: 30,
                            child: Text(fact),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}