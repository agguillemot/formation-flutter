import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyImages extends StatefulWidget {
  MyImages({
    Key key,
    this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  _MyImagesState createState() => _MyImagesState();
}

class _MyImagesState extends State<MyImages> {
  List<String> _displayedImages = [];

  @override
  void initState() {
    super.initState();

    _displayedImages = List.from(widget.images);
  }

  Widget _buildImages() {
    final imgs = _displayedImages.map((String url) {
      return ListTile(
        title: Image(
          image: NetworkImage(url),
        ),
        trailing: Icon(
          Icons.delete_outline,
        ),
        onTap: () {
          setState(() {
            _displayedImages.remove(url);
          });
        },
      );
    });

    final divided = ListTile.divideTiles(
      context: context,
      tiles: imgs,
    ).toList();

    return ListView(
      children: divided,
    );
  }

  void _resetImages() {
    print(widget.images);

    setState(() {
      _displayedImages = List.from(widget.images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget>[
          Text('Mes images '),
        ]),
        actions: [
          IconButton(
            icon: Icon(Icons.replay),
            onPressed: _resetImages,
          ),
        ],
      ),
      body: _buildImages(),
    );
  }
}
