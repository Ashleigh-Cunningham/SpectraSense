import 'package:flutter/material.dart';

class ViewData extends StatelessWidget {
  const ViewData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpectraSense'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the SpectraSense App. Please select an option below.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}