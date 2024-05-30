import 'package:flutter/material.dart';
import 'package:food_focus/src/providers/language_provider.dart';
import 'package:provider/provider.dart';

//A view designed to give users a selection between language settings (presents languages as clickable tiles)
//This is a mock view, not functional, only meant to provide a future structure for a page like this
class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Row(
            children: [
              Image.asset('assets/images/food_focus_logo.png',
                  width: 40, height: 40),
              const SizedBox(width: 10),
              const Text("Food Focus", style: TextStyle(color: Colors.green)),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0.0),
      body: Consumer<LanguageProvider>(builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Pick a language",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w800)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _createLanguageTile(
                    'English', 'assets/images/flags/us.jpg', provider),
                const SizedBox(width: 10.0),
                _createLanguageTile(
                    'Chinese', 'assets/images/flags/china.png', provider),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _createLanguageTile(
                    'Spanish', 'assets/images/flags/spain.png', provider),
                const SizedBox(width: 10.0),
                _createLanguageTile(
                    'Hindi', 'assets/images/flags/india.png', provider),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _createLanguageTile(
                    'French', 'assets/images/flags/france.png', provider),
                const SizedBox(width: 10.0),
                _createLanguageTile(
                    'Russian', 'assets/images/flags/russia.png', provider),
              ],
            ),
          ],
        );
      }),
    );
  }

  Widget _createLanguageTile(
      String language, String filePath, LanguageProvider provider) {
    //Style the tile depending on its selection status

    bool isSelected = language == provider.languageSelected;
    String label = isSelected
        ? '$language currently selected'
        : 'Select $language language';
    Color bgColor = isSelected
        ? const Color.fromARGB(255, 0, 0, 0)
        : const Color.fromARGB(255, 255, 255, 255);
    Color txtColor = isSelected
        ? const Color.fromARGB(255, 255, 255, 255)
        : const Color.fromARGB(255, 0, 0, 0);

    return Semantics(
      label: label,
      child: Container(
        height: 65,
        width: 140,
        margin:
            const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
        child: Material(
          color: bgColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(color: Colors.black, width: 3.0)),
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(
                    filePath,
                    width: 35.0,
                    height: 20.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  language,
                  style: TextStyle(
                      color: txtColor,
                      fontSize: 18.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            onTap: () {
              //When clicked, the selected language will be reflected in the provider
              provider.languageSelected = language;
            },
          ),
        ),
      ),
    );
  }
}
