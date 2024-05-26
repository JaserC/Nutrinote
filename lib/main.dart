import 'package:flutter/material.dart';
import 'package:food_focus/src/providers/history_provider.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.

  //await dotenv.load(fileName: ".env");

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(
      ChangeNotifierProvider(
        create: (context) => HistoryProvider() , 
        child: MyApp(),
      )
    );

  
}
