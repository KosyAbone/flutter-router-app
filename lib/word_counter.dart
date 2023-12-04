import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WordCounterPage extends StatefulWidget {
  const WordCounterPage({Key? key}) : super(key: key);

  @override
  _WordCounterPageState createState() => _WordCounterPageState();
}

class _WordCounterPageState extends State<WordCounterPage> {
  int _wordCount = 0;

  // Function to update the word count based on the text entered
  void _updateWordCount(String text) {
    setState(() {
      _wordCount = text.length; // Update word count based on the text length
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Word Counter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Heading text to instruct user
            const Text(
              'Enter any word and see the word count below!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            const SizedBox(height: 50),

            // Text field to input text and trigger word count update
            TextField(
              onChanged: _updateWordCount, // Trigger updateWordCount function when text is entered
              decoration: const InputDecoration(
                labelText: 'Enter text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),

            // Display the word count
            Text('Word Count: $_wordCount', style: const TextStyle(fontSize: 20)), // Display word count
            const SizedBox(height: 50),

            // Button to navigate back to home
            Positioned(
              bottom: 20.0,
              right: 20.0,
              child: FloatingActionButton(
                onPressed: () {
                  context.go('/'); // Navigate to home page
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
