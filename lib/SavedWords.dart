import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SavedWords extends StatefulWidget {
  SavedWords({
    Key key,
    this.saved,
    this.onDelete,
  }) : super(key: key);

  final Set<WordPair> saved;
  final Function onDelete;

  @override
  _SavedWordsState createState() => _SavedWordsState();
}

class _SavedWordsState extends State<SavedWords> {
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _emptyFavList() {
    return Padding(
      child: Text(
        'Aucun favoris :(',
        style: _biggerFont,
      ),
      padding: EdgeInsets.all(16.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tiles = widget.saved.map(
      (WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
          trailing: Icon(
            Icons.delete_outline,
            color: null,
          ),
          onTap: () {
            setState(() {
              widget.onDelete(pair);
            });
          },
        );
      },
    );
    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget>[
          Text('Favoris '),
          Icon(
            Icons.favorite_border,
            color: null,
          ),
        ]),
      ),
      body: tiles.length == 0 ? _emptyFavList() : ListView(children: divided),
    );
  }
}
