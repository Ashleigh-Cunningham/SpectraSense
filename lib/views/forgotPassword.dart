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
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot your password?')
        ,),
      body: Column(
            children: [
              TextField(controller: _email,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: "  Email",
                  )),
              TextButton(onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Email sent. Check your inbox and SPAM folder. The email may take a minute or two to come through.')),
                );
                await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text);
              },
                  child: const Text('Submit'))
            ],
          )
        );
        }
  }