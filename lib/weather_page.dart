import 'dart:convert';

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
  Map<String, dynamic> _weatherInfo = {};

  Future<void> _getWeather(String city) async {
    // Replace 'YOUR_API_KEY' with the actual API key
    const apiKey = '10ec237e4e034eda983202746231610';
    final apiUrl =
        'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        _weatherInfo = json
            .decode(response.body); // Convert the JSON data to a Map<String, dynamic>
      });
    } else {
      setState(() {
        _weatherInfo = {'error': 'Failed to fetch weather data'};
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
            // Text(_weatherInfo),
            if (_weatherInfo.containsKey('error'))
              Text(_weatherInfo['error'])
            else
              Column(
                children: [
                  if (_weatherInfo != null &&
                      _weatherInfo.containsKey('current'))
                    Text('Temperature: ${_weatherInfo['current']['temp_c']}°C'),
                  if (_weatherInfo != null &&
                      _weatherInfo.containsKey('current') &&
                      _weatherInfo['current'].containsKey('condition'))
                    Text(
                        'Weather: ${_weatherInfo['current']['condition']['text']}'),
                  if (_weatherInfo != null &&
                      _weatherInfo.containsKey('current') &&
                      _weatherInfo['current'].containsKey('humidity'))
                    Text('Humidity: ${_weatherInfo['current']['humidity']}%'),
                ],
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
      ),
    );
  }
}
