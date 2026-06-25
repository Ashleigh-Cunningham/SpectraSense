import 'package:brigid/views/home_view.dart';
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
      backgroundColor: Colors.deepOrangeAccent,
        appBar: AppBar(
          title: const Text('SpectraSense'),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Column(
            children: [
              Text(
                "This is the self-reporting section. Here you can make your own notes and review previous notes. Type or scroll down to view your previous notes.",
                 style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Healthcare(),),);
              }, child: Text("Contact or send data to healthcare provider."),
              ),
              SizedBox(
                height: 20,
              ),
            TextField(
                controller: _content,
                obscureText: false,
                enableSuggestions: false,
                autocorrect: true,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: "Enter your progress here.",
                ),
            ),
              ElevatedButton(onPressed: () {
                FirebaseFirestore.instance.collection("entries").add({"Date": FieldValue.serverTimestamp(), "Content": _content.text, "User": FirebaseAuth.instance.currentUser?.uid});
              }, child: Text("Send:"),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                  child: StreamBuilder(stream: FirebaseFirestore.instance.collection("entries").where("User", isEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots(),
                      builder: (context, snapshot) {
                        if(!snapshot.hasData){
                          return CircularProgressIndicator();
                        }
                        var notes = snapshot.data!.docs;

                        return ListView.builder(
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.teal,
                              child: Padding(
                                  padding: EdgeInsetsGeometry.all(20),
                                  child: Text(notes[index]["Content"])
                              ),
                            );
                          }
                        );
                      }
                  )
              )

        ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
        BottomNavigationBarItem(icon: Icon(Icons.data_usage), label: 'Data',),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings',),
        ],
        onTap: (index) {
        if (index == 0){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
        }
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
        ),
    );
  }
}