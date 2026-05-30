<<<<<<< Updated upstream
=======
// ignore: unused_import
import 'package:flutter/material.dart';
>>>>>>> Stashed changes
import 'package:brigid/firebase_options.dart';
import 'package:brigid/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:brigid/views/home_view.dart';
=======
>>>>>>> Stashed changes

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
<<<<<<< Updated upstream
      title: 'SpectraSense Alaytics',
=======
      title: 'Flutter Demo',
>>>>>>> Stashed changes
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 232, 6, 112),
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
<<<<<<< Updated upstream
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
=======
    return Scaffold(
      appBar: AppBar(title: const Text('Route Page')),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user?.emailVerified ?? false) {
                print('user is verified');
              } else {
                print('user is not verified, please verify your email first');
              }
              return const Text('Hai!! :3');
            default:
              return const Text('Loading...');
          }
        },
      ),
>>>>>>> Stashed changes
    );
  }
}
