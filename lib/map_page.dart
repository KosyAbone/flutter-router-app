import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

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
                child: Text('Map Page'),
              ),
              const SizedBox(height: 20),
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