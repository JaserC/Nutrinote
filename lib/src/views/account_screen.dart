import 'package:flutter/material.dart';

//This is a placeholder mock screen to represent a potential account screen for users
//In a fully fleshed out application, users may want to change preferences, permissions, etc.
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Row(
            children: [
              Image.asset('assets/images/food_focus_logo.png',
                  width: 40, height: 40),
              const SizedBox(width: 10),
              const Text("Food Focus", style: TextStyle(color: Colors.green)),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0.0),
      body: const Center(
          child: Text('Account Screen Placeholder for MVP',
              style: TextStyle(color: Colors.black))),
    );
  }
}
