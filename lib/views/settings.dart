import 'package:flutter/material.dart';
import 'package:brigid/views/view_data.dart';
import 'package:brigid/main.dart';
bool isDarkMode = false;
class Settings extends StatefulWidget {
  const Settings({super.key});
  State<Settings> createState() => _Settings();
}
  class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpectraSense'),
      ),
      body: const Column(
        children: [
          Text(
            'Welcome to the SpectraSense App. Please select an option below.',
            style: TextStyle(fontSize: 24),
          ),
        ]
      ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          // 3. Toggle the global themeNotifier value directly!
          if (themeNotifier.value == ThemeMode.light) {
            themeNotifier.value = ThemeMode.dark;
          } else {
            themeNotifier.value = ThemeMode.light;
          }
        },),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.data_usage), label: 'Data',),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings',),
        ],
          onTap: (index) {
            if (index == 0){}
            if (index == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewData()));
            }
            if (index == 2)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Settings()));
            }
          },
        )
    );
  }
}