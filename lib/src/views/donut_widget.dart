import 'package:flutter/material.dart';

class DonutWidget extends StatelessWidget {
  const DonutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Using the Scaffold here gets us the back button for free
    // Note, though, that it does not get us the nav bar at the bottom
    // We need to do a bit of work to get that
    return Scaffold(
        appBar: AppBar(
          title: const Text('Donut Land'),
        ),
        body: const Center(child: Icon(Icons.donut_large, size: 92))
        
    );
  }
}