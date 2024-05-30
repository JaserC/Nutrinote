import 'package:flutter/material.dart';
import 'package:food_focus/src/models/food_item.dart';
import 'package:food_focus/src/providers/history_provider.dart';
import 'package:provider/provider.dart';

// StatefulWidget to create a dynamic history screen.
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  // Creating state for this screen.
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // List to display filtered or sorted past items.
  List<PreviousItem> displayList = [];

  // Function to update the list of history items.
  void updateList(HistoryProvider historyProvider) {
    //filtering our list
    setState(() {
      displayList = historyProvider.pastFoods;
      // Sorting the list by date in descending order.  
      displayList.sort((a, b) => b.dateTime.compareTo(a.dateTime));
      });
  }

  @override
  // Initialization of state and updating list post widget build.
  void initState() {
    super.initState();
    // Ensuring the list is updated after the widget is built.
      WidgetsBinding.instance.addPostFrameCallback((_) {
      final historyProvider =
          Provider.of<HistoryProvider>(context, listen: false);
      updateList(historyProvider);
    });
  }

  @override
  // Building the UI elements of the history screen.
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(
        builder: (context, historyProvider, unchangingChild) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => updateList(historyProvider),
          backgroundColor: Colors.green[300],
          child: const Icon(Icons.refresh),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Row(children: [
              Image.asset('assets/images/food_focus_logo.png',
                  width: 40, height: 40),
              const SizedBox(width: 10),
              const Text("Food Focus", style: TextStyle(color: Colors.green)),
            ]),
            backgroundColor: Colors.white,
            elevation: 0.0),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Semantics(
                  label: 'History Text',
                  child: const Text(
                    'History',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: "Montserrat"),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: displayList.length,
              itemBuilder: (context, index) => PreviousItem(
                mealName: displayList[index].mealName,
                mealImagePath: displayList[index].mealImagePath,
                nutritionFacts: displayList[index].nutritionFacts,
                dateTime: displayList[index].dateTime,
                location: displayList[index].location,
                uuid: displayList[index].uuid,
              ),
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),)
          ],
        ),
      );
    });
  }
}
