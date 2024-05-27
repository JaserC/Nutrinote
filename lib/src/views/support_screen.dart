import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

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
        elevation: 0.0
      ),
      body: const Center(child: Text('Support Screen', style: TextStyle(color: Colors.black))),
    );
  }
}