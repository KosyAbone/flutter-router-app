import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // For launching URLs
import 'package:go_router/go_router.dart'; // Router library for navigation
import 'package:http/http.dart' as http; // HTTP requests
import 'dart:convert'; // For handling JSON data

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  late Map<String, dynamic> newsData; // Holds the fetched news data
  bool loading = true; // Flag to indicate loading state
  late String? error; // Stores error message if fetching fails
  late String topic; // Holds the topic for news search

  @override
  void initState() {
    super.initState();
    newsData = {};
    loading = true;
    error = null;
    topic = 'Canada Latest'; // Default topic for news

    // Display the newsFeed on first launch
    fetchNews();
  }

  // Fetches news data from the API
  Future<void> fetchNews() async {
    setState(() {
      loading = true; // Set loading state
      error = null; // Reset error message
    });

    final url = 'https://newsapi.org/v2/everything?q=$topic&apiKey=6c3e339d0b2b4276a1c1b0ed696e52ac';

    try {
      final response = await http.get(Uri.parse(url)); // Make GET request to the API
      final responseData = json.decode(response.body); // Decode the response body
      setState(() {
        newsData = responseData; // Update newsData with the fetched data
        loading = false; // Set loading state as complete
      });
    } catch (e) {
      if (topic.isEmpty) {
        setState(() {
          error = 'Please search for a news topic'; // Set error message if topic is empty
          loading = false; // Set loading state as complete
        });
      } else {
        setState(() {
          error = 'An error occurred while fetching news'; // Set generic error message
          loading = false; // Set loading state as complete
        });
      }
    }
  }

  // Triggers news fetch when user provides input
  void searchNews() {
    fetchNews();
  }

  // Builds the UI for displaying news articles
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NewsFeed')), // AppBar with title
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  topic = value; // Update topic when user enters text
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search News', // Input field for news search
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: searchNews, // Trigger searchNews function on button press
              child: const Text('Search'), // Search button
            ),
            const SizedBox(height: 10),
            if (loading)
              const Text('Loading...') // Display loading indicator
            else if (error != null)
              Text('Error: $error') // Display error message if fetching fails
            else
              Expanded(
                child: ListView.builder(
                  itemCount: newsData['articles']?.length ?? 0, // Number of articles to display
                  itemBuilder: (context, index) {
                    final article = newsData['articles'][index]; // Get individual article data
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          children: [
                            Text(
                              article['title'] ?? '', // Display article title
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(article['description'] ?? '', style: const TextStyle(fontSize: 16)),
                            TextButton(
                              onPressed: () {
                                // Open article URL in a browser when 'Read More' is clicked
                                launch(Uri.parse(article['url']).toString());
                              },
                              child: const Text('Read More'), // Button for reading full article
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/'); // Navigate back to the home page on FloatingActionButton press
        },
        child: const Icon(Icons.home), // Home button icon
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Set FAB position
    );
  }
}
