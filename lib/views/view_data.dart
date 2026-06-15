import 'package:brigid/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:brigid/views/settings2.dart';

class ViewData extends StatelessWidget {
  const ViewData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpectraSense'),
      ),
      body: const Column(
        children: [
          Text(
            "Here's the data view page. Here you can view all your data in the tables below.",
            style: TextStyle(fontSize: 19),
          ),

        ]
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Icons.data_usage), label: 'Data',),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings',),
      ],
        onTap: (index) {
          if (index == 0){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeView()));
          }
          if (index == 1) {
          }
          if (index == 2)
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Settings2()));
          }
        },
      ),
    );
  }
}