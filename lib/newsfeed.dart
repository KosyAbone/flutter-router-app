import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  late Map<String, dynamic> newsData;
  bool loading = true;
  late String? error;
  late String topic;

  @override
  void initState() {
    super.initState();
    newsData = {};
    loading = true;
    error = null;
    topic = 'Canada Latest';

    // Display the newsfeed on first launch
    fetchNews();
  }

  // Fetch the news from the API
  Future<void> fetchNews() async {
    setState(() {
      loading = true;
      error = null;
    });

    final url =
        'https://newsapi.org/v2/everything?q=$topic&apiKey=6c3e339d0b2b4276a1c1b0ed696e52ac';

    try {
      final response = await http.get(Uri.parse(url));
      final responseData = json.decode(response.body);
      setState(() {
        newsData = responseData;
        loading = false;
      });
    } catch (e) {
      if (topic.isEmpty) {
        setState(() {
          error = 'Please search for a news topic';
          loading = false;
        });
      } else {
        setState(() {
          error = 'An error occurred while fetching news';
          loading = false;
        });
      }
    }
  }

  // Call the fetchNews function when the user provides an input
  void searchNews() {
    fetchNews();
  }

  // Displaying the result of the news API call
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NewsFeed')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  topic = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search News',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: searchNews,
              child: Text('Search'),
            ),
            SizedBox(height: 10),
            if (loading)
              Text('Loading...')
            else if (error != null)
              Text('Error: $error')
            else
              Expanded(
                child: ListView.builder(
                  itemCount: newsData['articles']?.length ?? 0,
                  itemBuilder: (context, index) {
                    final article = newsData['articles'][index];
                    return Card(
                      child: Column(
                        children: [
                          Text(
                            article['title'] ?? '',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(article['description'] ?? ''),
                          TextButton(
                            onPressed: () {
                              // Open the article URL in a browser
                            },
                            child: Text('Read More'),
                          ),
                        ],
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
          context.go('/');
        },
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
