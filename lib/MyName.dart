import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyName extends StatefulWidget {
  MyName({Key key,}) : super(key: key);

  @override
  _MyNameState createState() => _MyNameState();
}

class _MyNameState extends State<MyName> {
  String _name;
  String _surname;

  @override void initState() {
    super.initState();

    _name = 'default';
    _surname = 'default';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My name'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _surname = value;
                });
              },
            ),
            Row(
              children: <Widget>[
                Text(
                  'name: ',
                ),
                Text(
                  '$_name',
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  'surname: ',
                ),
                Text(
                  '$_surname',
                ),
              ],
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
