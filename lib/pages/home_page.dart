import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/calculator');
              },
              child: const Text('Calculator'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/api');
              },
              child: const Text('API Integration'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notes');
              },
              child: const Text('Notes'),
            ),
          ],
        ),
      ),
    );
  }
}
