import 'package:flutter/material.dart';
import 'package:food_focus/src/models/food_item.dart';
import 'package:food_focus/src/providers/history_provider.dart';
import 'package:food_focus/src/utils/uuid_generator.dart';
import 'package:provider/provider.dart';


class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  List<PreviousItem> displayList = [];

  void updateList (HistoryProvider historyProvider) {
    //filtering our list
    setState(() {
      displayList = historyProvider.pastFoods;
      });
  }

  @override
  void initState() {
    super.initState();
    // Update the list when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final historyProvider = Provider.of<HistoryProvider>(context, listen: false);
      updateList(historyProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider> (
      builder: (context, historyProvider, unchangingChild) {
        return Scaffold(
          floatingActionButton: FloatingActionButton (
            onPressed: () => updateList(historyProvider),
            child: const Icon(Icons.refresh),
            backgroundColor: Colors.green[300],
            ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Row(
              children: [
              Image.asset('assets/images/food_focus_logo.png', width: 40, height: 40),
              const SizedBox(width: 10),    
              const Text("Food Focus", style: TextStyle(color: Colors.green)), ]
            ),
            backgroundColor: Colors.white,
            elevation: 0.0
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 120,
                        mainAxisExtent: 190,
                      ),
                      itemCount: displayList.length,
                      itemBuilder: (context,index) => PreviousItem(
                        mealName: displayList[index].mealName, 
                        mealImagePath: displayList[index].mealImagePath, 
                        nutritionFacts: displayList[index].nutritionFacts, 
                        dateTime: displayList[index].dateTime,
                        location: displayList[index].location,
                        uuid: displayList[index].uuid,
                      ),
                  ),
            ),
          ),
        );
      }
    );
  }
}