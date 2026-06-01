import 'package:flutter/material.dart';
import 'package:brigid/views/settings.dart';

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
            'Here\'s the data view page. Here you can view all your data in the tables below.',
            style: TextStyle(fontSize: 12),
          ),

        ]
      ),
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
      ),
    );
  }
}