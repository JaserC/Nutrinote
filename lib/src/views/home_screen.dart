import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Row(
          children: [
          Icon(Icons.food_bank, color: Colors.green, size: 40),
          SizedBox(width: 20),    
          Text("Food Focus", style: TextStyle(color: Colors.green)), ]
        ),
        backgroundColor: Colors.white,
        elevation: 0.0
      ),
      body: const Center(child: Text('Welcome back', style: TextStyle(color: Colors.black))),
    );
  }
}