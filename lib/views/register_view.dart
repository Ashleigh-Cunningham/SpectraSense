// ignore: unused_import
import 'package:brigid/firebase_options.dart';
import 'package:brigid/views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(title: const Text('Register')
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
            )),
            TextField(controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
              hintText: "  Password",
            )),
            TextButton(
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.red)),
            onPressed: () async {
            
        
              final email = _email.text;
              final password = _password.text;
              try{
              final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email,
                password: password
                );
              print(userCredential);
              await userCredential.user!.sendEmailVerification();
              }
            on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('The password provided is too weak.');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter a password that is at least 6 characters long')));
              } else if (e.code == 'invalid-email') {
                print('The email address is not valid.');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Invalid email')));
              } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Email already in use')));
              } else {
                print('Error: ${e.code}');
              }
            } catch (e) {
              print('Error: $e');
            }

            },
            child: const Text ('Register')
                   ),
          ],
        );
        },  
      )
    ,);
  }
}

