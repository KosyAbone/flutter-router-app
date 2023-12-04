import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/router.dart'; // Importing the router file

void main() {
  runApp(const MyApp()); // Entry point of the app
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // Using GoRouter for routing
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      theme: ThemeData.light().copyWith(
        // Customizing app theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 233, 126, 44), // Custom app bar color
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Assignment App')), // App bar title
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Aligns children at the center horizontally
          children: [
            const SizedBox(height: 50), // Empty space for better layout
            const Center(
              child: Text(
                'Welcome to Flutter Assignment App!', // Welcome message
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold), // Styling the text
              ),
            ),
            const SizedBox(height: 20), // Empty space for better layout
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/welcome_image.jpeg', // Image asset
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.contain, // For image to fit within its container
                ),
              ),
            ),
            const Text(
              'Explore the app features:', // Description text
              style: TextStyle(fontSize: 19), // Styling the text
            ),
            const SizedBox(height: 50), // Empty space for better layout
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // Aligns children to occupy the full width
              children: [
                ElevatedButton(
                  onPressed: () => context.go('/newsFeed'), // Navigates to 'NewsFeed'
                  child: const Text('NewsFeed', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => context.go('/wordCounter'), // Navigates to 'Word Counter'
                  child: const Text('Word Counter', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 20), 
                ElevatedButton(
                  onPressed: () => context.go('/weather'), // Navigates to 'Weather'
                  child: const Text('Weather', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 60), // Empty space for better layout
              ],
            ),
          ],
        ),
      ),
    );
  }
}
