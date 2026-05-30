import 'package:flutter/material.dart';

class ViewData extends StatelessWidget {
  const ViewData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpectraSense'),
      ),
      body: const Column(
        children: [
          Text(
            'Here\'s the data view page. Here you can view all your data in the tables below.',
            style: TextStyle(fontSize: 12),
          ),
        ]
      ),
    );
  }
}