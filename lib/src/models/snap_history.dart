// import 'package:hive/hive.dart';

// import 'snap.dart'; // Assuming JournalEntry class is defined in journal_entry.dart

// class SnapHistory {
//   final List<Snap>
//       _snaps; //The entries will represented by a list (like pages in a book)
//   final Box<Snap> _storage;

//   //Constructor intializes journal name and entries list
//   SnapHistory({List<Snap>? snaps, required Box<Snap> storage})
//       : _snaps = snaps ??
//             [], // Initialize entries list with provided entries or an empty list
//         _storage = storage {
//     _initializeSnapsFromStorage(); // Call a method to initialize _entries from _storage
//   }

//   List<Snap> get snaps =>
//       List.from(_snaps); //Returns a list comprised of all entries in the list

//   void _initializeSnapsFromStorage() {
//     _snaps.addAll(
//         _storage.values); // Add all values from storage to _entries list
//   }

//   //Adds an entry to the entries list if not present already (updates an existing entry)
//   void upsertEntry(Snap snap) {
//     _storage.put(snap.uuid, snap);
//   }

//   //Calls the constructor with a copy of the entries list to create an identical Journal object
//   SnapHistory clone() {
//     return SnapHistory(storage: _storage);
//   }
// }
