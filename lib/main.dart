import 'package:brigid/firebase_options.dart';
import 'package:brigid/views/login_view.dart';
import 'package:brigid/views/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:brigid/views/home_view.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});
@override
Widget build(BuildContext context) {
// 2. Wrap MaterialApp so it rebuilds ONLY the theme when themeNotifier changes
return ValueListenableBuilder<ThemeMode>(
valueListenable: themeNotifier,
builder: (_, currentThemeMode, __) {
return MaterialApp(
title: 'SpectraSense Analytics',
theme: ThemeData.light(useMaterial3: true),
darkTheme: ThemeData.dark(useMaterial3: true),
themeMode: currentThemeMode,
home: const Routepage(),
);
  },
);
     //changed @8:11 to make usre the app doesnt rebuild everytime
    }
}
class Routepage extends StatelessWidget {
const Routepage({super.key});

@override
Widget build(BuildContext context) {
final user = FirebaseAuth.instance.currentUser;
if (user != null  && (user.emailVerified)) {
return const HomeView();
} else {
return const LoginView();
}
}
}