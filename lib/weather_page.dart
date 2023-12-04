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

  // Function to fetch weather data based on the city name
  Future<void> _getWeather(String city) async {
    const apiKey = '10ec237e4e034eda983202746231610';
    final apiUrl = 'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city';

    final response = await http.get(Uri.parse(apiUrl)); // Make GET request to the API

    if (response.statusCode == 200) { // Check if the response is successful
      setState(() {
        _weatherInfo = json.decode(response.body); // Update weatherInfo with the fetched data
      });
    } else {
      setState(() {
        _weatherInfo = {'error': 'Failed to fetch weather data'}; // Set error message
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
              // Heading Text to instruct user
              const Text(
                'Enter City and see its current weather details',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 80),

              // Text field to input city
              TextField(
                controller: _cityController,
                decoration: const InputDecoration(
                  labelText: 'Enter City',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Button to trigger weather data fetch
              ElevatedButton(
                onPressed: () {
                  String city = _cityController.text;
                  _getWeather(city);
                },
                child: const Text('Search'),
              ),
              const SizedBox(height: 20),

              // Display weather information or error
              if (_weatherInfo.containsKey('error'))
                Text(_weatherInfo['error'])
              else if (_weatherInfo.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Display location name and weather details
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

              // Button to navigate back to home
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
