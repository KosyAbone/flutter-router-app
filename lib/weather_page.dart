import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;


class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController _cityController = TextEditingController();
  String _weatherInfo = '';

  Future<void> _getWeather(String city) async {
    // Replace 'YOUR_API_KEY' with the actual API key
    const apiKey = 'YOUR_API_KEY';
    final apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';
    
    final response = await http.get(Uri.parse(apiUrl));
    
    if (response.statusCode == 200) {
      setState(() {
        _weatherInfo = response.body; // Handle and format the response as needed
      });
    } else {
      setState(() {
        _weatherInfo = 'Failed to fetch weather data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Enter City',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String city = _cityController.text;
                _getWeather(city);
              },
              child: const Text('Search'),
            ),
            const SizedBox(height: 20),
            Text(_weatherInfo),
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
      ),
    );
  }
}
