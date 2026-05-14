import 'package:brigid/firebase_options.dart';
import 'package:brigid/views/login_view.dart';
import 'package:brigid/views/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:brigid/views/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 232, 6, 112),
          surface: const Color.fromARGB(255, 1, 190, 255)
        ),
      ),
      home: const Routepage(),
    ),
  ); //changed @8:11 to make usre the app doesnt rebuild everytime
}

class Routepage extends StatelessWidget {
  const Routepage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options:DefaultFirebaseOptions.currentPlatform
    ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user?.emailVerified ?? false) {
                return const HomeView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
        }
        return const SizedBox();
      },
    );
  }
}
