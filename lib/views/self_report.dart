import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:brigid/views/view_data.dart';
import 'package:brigid/views/settings2.dart';
import 'package:brigid/views/healthcare.dart';
import 'package:brigid/main.dart';
bool isDarkMode = false;
class SelfReport extends StatefulWidget {
  const SelfReport({super.key});
  State<SelfReport> createState() => _SelfReport();
}
class _SelfReport extends State<SelfReport> {
  @override
  final TextEditingController _content = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SpectraSense'),
        ),
        body: Column(
            children: [
              Text(
                'Diary: Here you can self-report opioid use and track your reports. You can also send these results to your healthcare provider.',
                style: TextStyle(fontSize: 19),
              ),
              ElevatedButton(onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Healthcare(),),);
              }, child: Text("Contact or send data to healthcare provider."),
              ),
            TextField(
                controller: _content,
                obscureText: false,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: "Enter your progress here.",
                ),
            ),
              ElevatedButton(onPressed: () {
                FirebaseFirestore.instance.collection("entries").add({"Date": FieldValue.serverTimestamp(), "Content": _content.text, "User": FirebaseAuth.instance.currentUser?.uid});
              }, child: Text("Send:"),
              ),
        ],
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
    );
  }
}