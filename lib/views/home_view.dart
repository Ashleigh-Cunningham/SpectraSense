import 'package:brigid/views/view_data.dart';
import 'package:brigid/views/settings.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _State();
}

class _State extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpectraSense'),
      ),
      body: Center(
        child: Column(
            children: [
              Text(
                  'Welcome to the SpectraSense App. Please select an option below.',
                  style: TextStyle(fontSize: 12)),
              ElevatedButton(onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ViewData(),),);
              }, child: Text("See Recent Data"),
              ),
              ElevatedButton(onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ViewData(),),);
              }, child: Text("See Recent Data"),
              )
            ]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Icons.data_usage), label: 'Data',),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings), label: 'Settings',),
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

        }

        ,

      )

      ,

    );
  }
}




