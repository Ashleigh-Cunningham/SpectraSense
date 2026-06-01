import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUp> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  Future<void> registerUser() async {
    try {
      final email = _email.text.trim();
      final password = _password.text.trim();

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('User registered!');
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'weak-password') {
        print('Password is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('Email already exists.');
      } else if (e.code == 'invalid-email') {
        print('Invalid email.');
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Page'),
      ),
      body: Column(
        children: [
          Text(
            'Welcome to the SpectraSense App! Please insert a new email and password below.',
            style: TextStyle(fontSize: 15),
          ),
          Text(
            'You will be asked to verify your email after pressing Submit. You will not be able to enter the app until you verify your email.',
            style: TextStyle(fontSize: 11),
          ),
          TextField(controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                hintText: "  Email",
              )),
          TextField(controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "  Password",
              )),
          ElevatedButton(onPressed: registerUser,
              child: const Text('Submit'))
        ]
      ),
    );
  }
}