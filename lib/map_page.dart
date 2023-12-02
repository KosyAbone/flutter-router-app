import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map Page')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text('Map Page Content Goes Here', style: TextStyle(fontSize: 24)),
              ),
              const SizedBox(height: 100),
              Positioned(
              bottom: 20.0,
              right: 20.0,
              child: FloatingActionButton(
                onPressed: () {
                  context.go('/');
                },
                child: const Icon(Icons.home),
              ),
            ),
            ],
          ),
        )
    );
  }
}