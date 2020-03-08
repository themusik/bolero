import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

// maintains the state for the RandomWords widget
class RandomWordsState extends State<RandomWords> {
  // any identifier that starts with an underscore(_)
  // means private to its library.
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          // Add a divider widget before each row in the ListView
          // Divider class from flutter/material.dart package
          if (i.isOdd) return Divider(); // every odd row will be a divider

          // divide "i" by 2 and returns an integer
          // which represents the actual number of rows
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            // If the index reached the end of the word pairings
            // then generate/add 10 more - lazy loading
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        )
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
