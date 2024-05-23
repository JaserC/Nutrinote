import 'package:flutter/material.dart';
import 'package:food_focus/src/views/about_screen.dart';
import 'package:food_focus/src/views/account_screen.dart';
import 'package:food_focus/src/views/delete_screen.dart';
import 'package:food_focus/src/views/faq_screen.dart';
import 'package:settings_ui/settings_ui.dart';

//https://www.dhiwise.com/post/crafting-the-ultimate-settings-ui-in-flutter


class ProfileScreen extends StatelessWidget {
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
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('General'),
            tiles: [
              SettingsTile.navigation(
                leading: const Icon(Icons.person),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text('Account Details'),
                onPressed: (context) {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => const AccountScreen()),
                  );
                },
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.delete),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text('Delete Account'),
                onPressed: (context) {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => const DeleteScreen()),
                  );
                },
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Accessibility'),
            tiles: [
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text('Language'),
                onPressed: (context) {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => const AccountScreen()),
                  );
                },
              ),
              SettingsTile(
                leading: const Icon(Icons.format_size),
                trailing: Slider(
                    min: 0.5,
                    max: 2.0,
                    divisions: 3,
                    value: 1.5,
                    onChanged: (value) => null,
                  ),                
                  title: const Text('Text Size'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Other'),
            tiles: [
              SettingsTile.navigation(
                leading: const Icon(Icons.info),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text('About Us'),
                onPressed: (context) {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => const AboutScreen()),
                  );
                },
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.question_mark),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: const Text('FAQ'),
                onPressed: (context) {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => const FaqScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      )
    );
  }
}