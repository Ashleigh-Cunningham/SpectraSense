import 'package:flutter/material.dart';

class Healthcare extends StatelessWidget {
  const Healthcare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ]
      ),
    );
  }
}