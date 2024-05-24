import 'package:flutter/material.dart';
import 'package:food_focus/src/models/food_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {



  List<FoodItem> displayList = List.from(foods);

  void updateList (String value) {
    //filtering our list
    setState(() {
      displayList = foods.where((element) => element.mealName.toLowerCase().contains(value.toLowerCase())).toList();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              TextField(
                onChanged: (value) => updateList(value),
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: "eg. chicken",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: displayList.length,
                  itemBuilder: (context,index) => FoodItem(
                    mealName: displayList[index].mealName,
                    mealImagePath: displayList[index].mealImagePath,
                  ),
                  )
              ),
          ]),
      ),
    );
  }
}