import 'package:flutter/material.dart';

import 'package:flutter_assignment/pages/calculator_page.dart';
import 'package:flutter_assignment/pages/api_page.dart';
import 'package:flutter_assignment/pages/notes_page.dart';
import 'package:flutter_assignment/pages/greeting_page.dart';
import 'package:flutter_assignment/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/': (context) => const GreetingPage(),
        '/home': (context) => const HomePage(),
        '/calculator': (context) => const CalculatorPage(),
        '/api': (context) => const APIPage(),
        '/notes': (context) => const NotesPage(),
      },
    );
  }
}
