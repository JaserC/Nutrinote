import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
              Image.asset('assets/images/food_focus_logo.png', width: 40, height: 40),
              const SizedBox(width: 10),
              const Text("Food Focus", style: TextStyle(color: Colors.green)),
            ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), 
          child: Semantics(
            label: 'About Food Focus',
            child: const Text(
              'Food Focus is a reverse image search application that gives users the ability to gain insights into the nutritional information of the food they consume on a daily basis. Along with this comes the ability to keep track of what, when, and where you eat. The home screen features meals for you to try out with information about the nutrition facts. You are welcomed to use our search feature to learn about different food nutritional information. Food Focus has a camera feature for you to take a picture of your food and will provide nutritional facts about the food you have taken a picture of. All the pictures you had taken will be saved in the History section.',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ),
      ),
    );
  }
}
