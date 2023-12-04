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
    final apiUrl = 'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        _weatherInfo = json.decode(response.body);
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Enter City and see its current weather details',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 80),
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
              if (_weatherInfo.containsKey('error'))
                Text(_weatherInfo['error'])
              else if (_weatherInfo.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (_weatherInfo.containsKey('location'))
                      Text(
                        _weatherInfo['location']['name'],
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    const SizedBox(height: 10),
                    if (_weatherInfo.containsKey('current'))
                      Text(
                        'Temperature: ${_weatherInfo['current']['temp_c']}°C',
                        style: const TextStyle(fontSize: 18),
                      ),
                    if (_weatherInfo.containsKey('current') &&
                        _weatherInfo['current'].containsKey('condition'))
                      Text(
                        'Weather: ${_weatherInfo['current']['condition']['text']}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    if (_weatherInfo.containsKey('current') &&
                        _weatherInfo['current'].containsKey('humidity'))
                      Text(
                        'Humidity: ${_weatherInfo['current']['humidity']}%',
                        style: const TextStyle(fontSize: 18),
                      ),
                  ],
                ),
              const SizedBox(height: 20),
              FloatingActionButton(
                onPressed: () {
                  context.go('/');
                },
                child: const Icon(Icons.home),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
