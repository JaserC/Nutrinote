import 'package:flutter/material.dart';
import 'package:food_focus/src/models/food_item.dart';
import 'package:food_focus/src/providers/history_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ItemAdapter());

  final box = await Hive.openBox<PreviousItem>('previous_items');

  runApp(
      ChangeNotifierProvider(
        create: (context) => HistoryProvider(box) , 
        child: const MyApp(),
      )
    );

  
}
