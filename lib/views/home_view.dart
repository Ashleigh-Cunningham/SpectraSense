import 'package:brigid/views/login_view.dart';
import 'package:brigid/views/view_data.dart';
import 'package:brigid/views/settings2.dart';
import 'package:brigid/views/healthcare.dart';
import 'package:brigid/views/self_report.dart';
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
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        title: const Text('SpectraSense'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Center(
        child: Column(
            children: [
              Text(
                  'Welcome to the SpectraSense App. Please select an option below.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17)),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ViewData(),),);
              }, child: Text("See Recent Data"),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Healthcare(),),);
              }, child: Text("Contact or send data to healthcare provider."),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SelfReport()));


              }, child: Text("Self-reporting")),
              SizedBox(height: 40),
              Text(
                  'Your stats at a glance:',
                  style: TextStyle(fontSize: 24)),
              ElevatedButton(onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PopScope(
                    canPop: false,
                    child: LoginView(),
                  )),);
              }, child: Text("Sign Out"),
              ),
            ]
        ),
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
                MaterialPageRoute(builder: (context) => Settings2()));
          }
        },
      )

      ,

    );
  }
}




