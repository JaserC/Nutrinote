import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_faq/flutter_faq.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

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
      body: Center(
        child: Column(
          children: [
            const Text("FAQ",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900)),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: FAQ(
                question: "Who is this app for?",
                answer:
                    "Anyone who wants to keep track of what they eat or is interested in learning more about food!",
                showDivider: false,
                expandedIcon: const Icon(
                  Icons.arrow_drop_up_rounded,
                  size: 40.0,
                  color: Colors.green,
                ),
                collapsedIcon:
                    const Icon(Icons.arrow_drop_down_rounded, size: 40.0),
                queStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
                ansStyle: const TextStyle(color: Colors.black, fontSize: 14.0),
                ansDecoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the top side
                    left: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the left side
                    right: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the right side
                    // No border for the bottom side
                  ),
                ),
                queDecoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: FAQ(
                question: "How do I get started?",
                answer:
                    "In whatever way you want! You can start by taking a picture of your next meal or start looking for meals you'd be interested in with our curated search.",
                showDivider: false,
                expandedIcon: const Icon(Icons.arrow_drop_up_rounded,
                    size: 40.0, color: Colors.green),
                collapsedIcon:
                    const Icon(Icons.arrow_drop_down_rounded, size: 40.0),
                queStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
                ansStyle: const TextStyle(color: Colors.black, fontSize: 14.0),
                ansDecoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the top side
                    left: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the left side
                    right: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the right side
                    // No border for the bottom side
                  ),
                ),
                queDecoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: FAQ(
                question: "How does this app work",
                answer:
                    "After you take a picture of your food, we will run it through a classification model that labels your food and saves these insights in your history tab. From there, it's up to you what you want to do with that information!",
                showDivider: false,
                expandedIcon: const Icon(Icons.arrow_drop_up_rounded,
                    size: 40.0, color: Colors.green),
                collapsedIcon:
                    const Icon(Icons.arrow_drop_down_rounded, size: 40.0),
                queStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
                ansStyle: const TextStyle(color: Colors.black, fontSize: 14.0),
                ansDecoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the top side
                    left: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the left side
                    right: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the right side
                    // No border for the bottom side
                  ),
                ),
                queDecoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: FAQ(
                question: "Can't take a picture?",
                answer:
                    "The camera functionality is dependent on your permissions. Go to your settings and give us camera and microphone permissions so we can continue to serve you!",
                showDivider: false,
                expandedIcon: const Icon(Icons.arrow_drop_up_rounded,
                    size: 40.0, color: Colors.green),
                collapsedIcon:
                    const Icon(Icons.arrow_drop_down_rounded, size: 40.0),
                queStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
                ansStyle: const TextStyle(color: Colors.black, fontSize: 14.0),
                ansDecoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the top side
                    left: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the left side
                    right: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the right side
                    // No border for the bottom side
                  ),
                ),
                queDecoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: FAQ(
                question: "Location not being saved?",
                answer:
                    "The app depends on your phone permissions to allow location tracking. Go to your settings and give us access to your location so we can continue to serve you!",
                showDivider: false,
                expandedIcon: const Icon(Icons.arrow_drop_up_rounded,
                    size: 40.0, color: Colors.green),
                collapsedIcon:
                    const Icon(Icons.arrow_drop_down_rounded, size: 40.0),
                queStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
                ansStyle: const TextStyle(color: Colors.black, fontSize: 14.0),
                ansDecoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the top side
                    left: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the left side
                    right: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the right side
                    // No border for the bottom side
                  ),
                ),
                queDecoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: FAQ(
                question: "These answers not helping?",
                answer:
                    "If you can't find answers to your specific scenario here, you are fresh out of luck. Shouldn't have expected so much of an app in beta!",
                showDivider: false,
                expandedIcon: const Icon(Icons.arrow_drop_up_rounded,
                    size: 40.0, color: Colors.green),
                collapsedIcon:
                    const Icon(Icons.arrow_drop_down_rounded, size: 40.0),
                queStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
                ansStyle: const TextStyle(color: Colors.black, fontSize: 14.0),
                ansDecoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the top side
                    left: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the left side
                    right: BorderSide(
                        width: 1.0,
                        color: Colors.black), // Border for the right side
                    // No border for the bottom side
                  ),
                ),
                queDecoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
