import 'package:flutter/material.dart';
import 'package:food_focus/src/models/food_item.dart';
import 'package:food_focus/src/models/snap.dart';
import 'package:food_focus/src/providers/history_provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ItemAdapter());

  final box = await Hive.openBox<PreviousItem>('previous_items');


  //await dotenv.load(fileName: ".env");

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(
      ChangeNotifierProvider(
        create: (context) => HistoryProvider(box) , 
        child: MyApp(),
      )
    );

  
}
