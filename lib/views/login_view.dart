// ignore_for_file: unused_import

import 'package:brigid/firebase_options.dart';
import 'package:brigid/views/signup.dart';
import 'package:brigid/views/forgotPassword.dart';
import 'package:brigid/views/register_view.dart';
import 'package:brigid/views/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    super.initState();

    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to SpectraSense'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: "Email",
            ),
          ),

          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: "Password",
            ),
          ),

          TextButton(
            onPressed: () async {
              final email = _email.text.trim();
              final password = _password.text.trim();

              try {
                await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                  email: email,
                  password: password,
                );

                if (!mounted) return;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(),
                  ),
                );

              } on FirebaseAuthException catch (e) {

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e.message ?? 'Login failed')),
                );

              } catch (e) {

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Unexpected error')),
                );
              }
            },
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => forgotView(),),);
            },
              child: const Text('Forgot Password?')
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterView(),),);
              },
              child: const Text('New User? Click here!')
          ),
        ],
      ),
    );
  }
}