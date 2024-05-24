import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:food_focus/src/models/snap.dart';
import 'package:food_focus/src/models/snap_history.dart';

class SnapProvider extends ChangeNotifier {
  final SnapHistory _history;

  //Instantiate journal object with a new one
  SnapProvider(Box<Snap> storage) : _history = SnapHistory(storage: storage);

  //Will return a clone of the journal
  SnapHistory get history => _history.clone();

  //Upsert within provider will call journal's upsert
  void upsertJournalEntry(Snap snap) {
    _history.upsertEntry(snap);
    notifyListeners();
  }
}
