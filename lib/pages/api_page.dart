import 'package:flutter/material.dart';

class APIPage extends StatelessWidget {
  const APIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Integration')),
      body: const Center(
        child: Text('API Page'),
      ),
    );
  }
}
