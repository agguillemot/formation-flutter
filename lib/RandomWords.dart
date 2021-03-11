import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formation/Battery.dart';
import 'package:formation/MyImages.dart';
import 'package:formation/SavedWords.dart';
import 'package:formation/WeatherPage.dart';

class RandomWords extends StatefulWidget {
  RandomWords({
    Key key,
  }) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);
  final _saved = <WordPair>{};

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            alreadySaved ? _saved.remove(pair) : _saved.add(pair);
          });
        },
      );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return SavedWords(
            saved: _saved,
            onDelete: (pair) {
              setState(() {
                _saved.remove(pair);
              });
            },
          );
        },
      ),
    );
  }

  void _goToImages() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return MyImages(
            images: [
              'https://cdn.mos.cms.futurecdn.net/6h8C6ygTdR2jyyUxkALwsc-1200-80.jpg',
              'https://images-eu.ssl-images-amazon.com/images/I/91dYFuM4xfL.png',
              'https://upload.wikimedia.org/wikipedia/commons/1/1a/Donkey_in_Clovelly%2C_North_Devon%2C_England.jpg',
              'https://s3.amazonaws.com/assets.farmsanctuary.org/content/uploads/2018/12/27061639/albert-header-2016-02-08_FSOR_Albert_DSC3240_CREDIT_Farm_Sanctuary-1-e1590885908701-1600x804.jpg',
            ],
          );
        },
      ),
    );
  }

  void _goToWeather() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return WeatherPage();
        },
      ),
    );
  }

  void _goToBattery() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Battery();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          ),
          IconButton(
            icon: Icon(Icons.image),
            onPressed: _goToImages,
          ),
          IconButton(
            icon: Icon(Icons.cloud_outlined),
            onPressed: _goToWeather,
          ),
          IconButton(
            icon: Icon(Icons.battery_full_outlined),
            onPressed: _goToBattery,
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}
