import 'package:flutter/material.dart';
import 'package:food_focus/src/models/food_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  static List<FoodItem> foods = [
    FoodItem('Peaches'),
    FoodItem('Orange'),
    FoodItem('Apples'),
    FoodItem('Strawberries'),
    FoodItem('Raspberries'),
    FoodItem('Bananas'),
    FoodItem('Tomato'),
    FoodItem('Blueberries'),
  ];

  List<FoodItem> displayList = List.from(foods);

  void updateList (String value) {
    //filtering our list
    setState(() {
      displayList = foods.where((element) => element.foodName.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

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
      body: Padding(
        padding: EdgeInsets.all(16),
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
                  hintText: "eg. Peaches",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: displayList.length,
                  itemBuilder: (context,index) => ListTile(
                    contentPadding: EdgeInsets.all(5.0),
                    leading: Icon(Icons.apple_outlined, color:Colors.greenAccent),
                    title:Text(displayList[index].foodName, style: TextStyle(color: Colors.green))
                  ),
                  )
              ),
          ]),
      ),
    );
  }
}