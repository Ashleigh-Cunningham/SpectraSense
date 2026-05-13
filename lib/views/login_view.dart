// ignore_for_file: unused_import

import 'package:brigid/firebase_options.dart';
import 'package:brigid/views/signup.dart';
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
            onPressed: () async {        
              final email = _email.text;
              final password = _password.text;
              try{
              final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email,
                password: password
                );
              print('user logged in');
              print(userCredential);
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeView(),),);
              }
              on FirebaseAuthException catch (e)
              {
                if (e.code == 'user-not-found') {
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('No user found for that email.')),
                );
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Wrong password provided for that user.')),
                );
                  print('Wrong password provided for that user.');
                } else {
                  print('Error: ${e.message}');
                  print('eeeee');
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(content: Text('Login failed. Try again with a different email and/or password.'),
                        leading: Icon(Icons.error), backgroundColor: Colors.redAccent, actions: [
                          TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                              },
                              child: const Text('Dismiss')
                          )
                        ]),
                  );
                  //IVALID CREDENTIAL FOR BOTH EMAIL AND PASSOWRD- CODE IS NOT DIFFERENTIATING

                }
              }
              catch (e) {
                print('Error: $e');
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(content: Text('Login failed. Try again with a different email and/or password.'),
                  leading: Icon(Icons.error), backgroundColor: Colors.redAccent, actions: [
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                      },
                      child: const Text('Dismiss')
                    )
                      ]),
                );
              }
            },
            child: const Text ('Login')
                   ),
            TextButton(onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUp(),),);
            }
                , child: const Text('New User? Sign up here.'))
          ],
        );
        },  
      )
    ,);
  }
}