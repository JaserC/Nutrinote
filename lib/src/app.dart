import 'package:flutter/material.dart';
import 'package:food_focus/src/views/history_screen.dart';
import 'package:food_focus/src/views/home_screen.dart';
import 'package:food_focus/src/views/profile_screen.dart';
import 'views/search_screen.dart';
import 'package:food_focus/src/views/camera_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavBarTemp(),
    );
  }
}

class NavBarTemp extends StatefulWidget {
  const NavBarTemp({super.key});

  @override
  State<NavBarTemp> createState() => _NavBarTempState();
}

class _NavBarTempState extends State<NavBarTemp> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.green,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined, color: Colors.black45,),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search, color: Colors.black45,),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.camera_alt_outlined, color: Colors.black45,),
            label: 'Camera',
          ),
          NavigationDestination(
            icon: Icon(Icons.history, color: Colors.black45,),
            label: 'History',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle, color: Colors.black45,),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        HomeScreen(),
        const SearchScreen(),
        const CameraScreen(),
        const HistoryScreen(),
        const ProfileScreen(),
      ][currentPageIndex],
    );
  }
}
