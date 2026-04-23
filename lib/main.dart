// ignore: unused_import
import 'package:brigid/firebase_options.dart';
import 'package:brigid/views/login_view.dart';
import 'package:brigid/views/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 232, 6, 112)),
      ),
      home: const Routepage(),
    ),);//changed @8:11 to make usre the app doesnt rebuild everytime
}

class Routepage extends StatelessWidget {
  const Routepage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold (
      appBar: AppBar(title: const Text('Route Page'),),
      body: FutureBuilder(
        future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
             ),
        builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user?.emailVerified ?? false){
              print ('user is verified');
            }
            else{
              print ('user is not verified, please verify your email first');
            }
             return const Text('Done');          
          default:
           return const Text('Loading...');
        }

        },  
      )
    ,);
  }
}

