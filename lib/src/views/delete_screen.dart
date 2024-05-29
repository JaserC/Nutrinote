import 'package:flutter/material.dart';

class DeleteScreen extends StatelessWidget {
  const DeleteScreen({super.key});

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
      body: Column(
        children: [
          Image.asset('assets/images/delete.jpg',
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.7),
          const Text("This action is irreversible",
              style: TextStyle(color: Color.fromARGB(255, 95, 95, 95))),
          Semantics(
            label: 'Delete Button',
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  'Delete Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white, // White text color
                    fontSize: 18.0, // Adjust font size as needed
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
