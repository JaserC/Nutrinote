import 'package:flutter/material.dart';

//This provider is used to keep track of which language is selected
//In a more flesh out application, we could use this information to inform how text is rendered
class LanguageProvider extends ChangeNotifier {
  String _languageSelected;

  LanguageProvider() : _languageSelected = "English";

  set languageSelected(String language) {
    _languageSelected = language;
  }

  String get languageSelected => _languageSelected;
}
