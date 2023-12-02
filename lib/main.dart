import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider
    );
  }
}


class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4, // Adjust as needed
            child: Center(
              child: Image.asset(
                'assets/images/welcome_image.jpeg',
                width: MediaQuery.of(context).size.width * 0.6, // Adjust as needed
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => context.go('/weather'),
                  child: const Text('Weather Search'),
                ),
                ElevatedButton(
                  onPressed: () => context.go('/map'),
                  child: const Text('Map'),
                ),
                ElevatedButton(
                  onPressed: () => context.go('/wordcounter'),
                  child: const Text('Word Counter'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}