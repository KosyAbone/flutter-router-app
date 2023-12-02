import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WordCounterPage extends StatefulWidget {
  const WordCounterPage({Key? key}) : super(key: key);

  @override
  _WordCounterPageState createState() => _WordCounterPageState();
}

class _WordCounterPageState extends State<WordCounterPage> {
  int _wordCount = 0;

  void _updateWordCount(String text) {
    setState(() {
      _wordCount = text.length;
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
            TextField(
              onChanged: _updateWordCount,
              decoration: const InputDecoration(
                labelText: 'Enter text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),
            Text('Word Count: $_wordCount', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 50),
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
