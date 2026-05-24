import 'package:brigid/firebase_options.dart';
import 'package:brigid/views/login_view.dart';
import 'package:brigid/views/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:brigid/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 232, 6, 112),
          surface: const Color.fromARGB(255, 200, 190, 255)
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
    final user = FirebaseAuth.instance.currentUser;

    if (user != null && (user.emailVerified)) {
      return const HomeView();
    } else {
      return const LoginView();
    }
  }
}
