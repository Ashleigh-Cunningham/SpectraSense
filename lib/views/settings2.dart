import 'package:brigid/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:brigid/views/view_data.dart';
import 'package:brigid/main.dart';
bool isDarkMode = false;
class Settings2 extends StatefulWidget {
  const Settings2({super.key});
  State<Settings2> createState() => _Settings2();
}
  class _Settings2 extends State<Settings2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpectraSense'),
      ),
      body: Column(
        children: [
          Text(
            'Welcome to the SpectraSense App. Please select an option below.',
            style: TextStyle(fontSize: 19),
          ),
          ElevatedButton(onPressed: () {
            if (themeNotifier.value == ThemeMode.light) {
              themeNotifier.value = ThemeMode.dark;
            } else {
              themeNotifier.value = ThemeMode.light;
            }
          }, child: Text("Dark/Light Mode")),
        ]
      ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.data_usage), label: 'Data',),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings',),
        ],
          onTap: (index) {
            if (index == 0){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeView()));
            }
            if (index == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewData()));
            }
            if (index == 2)
            {

            }
          },
        )
    );
  }
}