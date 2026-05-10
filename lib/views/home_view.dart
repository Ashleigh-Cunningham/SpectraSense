import 'package:brigid/views/view_data.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpectraSense'),
      ),
      body: Center(
        child: Column(
          children : [
            Text('Welcome to the SpectraSense App. Please select an option below.',
            style: TextStyle(fontSize: 24)),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewData(),),);}, child: Text("See Recent Data"),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewData(),),);}, child: Text("See Recent Data"),
            )
          ]
        ),
      ),
    );
  }
}


