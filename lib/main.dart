import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        theme: ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 233, 126, 44),
        )));
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Assignment App')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Image.asset(
                'assets/images/welcome_image.jpeg',
                height: MediaQuery.of(context).size.height *
                    0.6, // Adjust image size
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () => context.go('/weather'),
                  child: const Text('Weather'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => context.go('/newsfeed'),
                  child: const Text('NewsFeed'),
                ),
                const SizedBox(height: 20),
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
