import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String _languageSelected;

  LanguageProvider() : _languageSelected = "English";

  // TODO(required): Will set the tool we want to use to actually draw the component
  set languageSelected(String language) {
    _languageSelected = language;
  }

  String get languageSelected => _languageSelected;
}
