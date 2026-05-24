// ignore_for_file: unused_import

import 'package:brigid/firebase_options.dart';
import 'package:brigid/views/signup.dart';
import 'package:brigid/views/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class forgotView extends StatefulWidget {
  const forgotView({super.key});

  @override
  State<forgotView> createState() => _forgotState();
}


class _forgotState extends State<forgotView> {

  late final TextEditingController _email;

  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(title: const Text('Login to SpectraSense')
        ,),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:

              break;
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              }
              // Firebase is initialized successfully
              print('Firebase initialized successfully');
              break;
          }
          return Column(
            children: [
              TextField(controller: _email,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: "  Email",
                  ))
            ],
          );
        },
      )
      ,);
  }
}