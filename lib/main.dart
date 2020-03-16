import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:bolero/home/home.page.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}

/* -------------------------------------
    These line below can be deleted
  -------------------------------------- */
// maintains the state for the RandomWords widget
class RandomWordsState extends State<RandomWords> {
  // any identifier that starts with an underscore(_)
  // means private to its library.
  // Dart language doesn't have Public/Protected/Private statement
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    // push the route to the Navigator's stack
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
                (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          // ListTile.divideTiles() adds horizontal spacing between each ListTile
          // The "divided" variable holds the final rows, converted by toList()
          final List<Widget> divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();

          return Scaffold(
              appBar: AppBar(
                title: Text('Saved Suggestions'),
              ),
              body: ListView(children: divided)
          );
        },
      ),
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
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved? Icons.favorite: Icons.favorite_border,
        color: alreadySaved? Colors.redAccent: null,
      ),
      onTap: () {
        setState(() {
          // calling setState() triggers a call to build() method for the State object
          // resulting in an update to the UI
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
      onLongPress: () {
        // TODO: want to do something here later
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
