import 'package:flutter/material.dart';

class Healthcare extends StatelessWidget {
  const Healthcare({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController content = TextEditingController();
    final TextEditingController message = TextEditingController();
    return Scaffold(

      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        title: const Text('SpectraSense'),
      ),
      body: Column(
        children:
        [
          Text(
            'Here you can send data to your healthcare provider through email. Data you select will be sent as a .pdf file to the email address you have provided.',
            style: TextStyle(fontSize: 19),
          ),
          TextField(
            controller: content,
            obscureText: false,
            enableSuggestions: false,
            autocorrect: true,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: "Enter the email of your healthcare provider here.",
            ),
          ),
      TextField(
          controller: message,
          obscureText: false,
          enableSuggestions: false,
          autocorrect: true,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: "Would you like to attach a message? Input it here.",
          ),
        ),
        ]
      ),
    );
  }
}