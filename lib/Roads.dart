import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formation/Page1.dart';
import 'package:formation/Page2.dart';
import 'package:formation/providers/userProvider.dart';
import 'package:provider/provider.dart';

class Roads extends StatefulWidget {
  @override
  RoadsState createState() => RoadsState();
}

class RoadsState extends State<Roads> {
  // UserProvider userProvider;

  // @override
  // void initState() {
  //   final userProvider = Provider.of<UserProvider>(
  //     context,
  //     listen: false,
  //   );

  //   super.initState();
  // }

  void _goToPage1() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Page1();
        },
      ),
    );
  }

  void _goToPage2() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Page2();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: <Widget>[
          Icon(
            Icons.directions,
            color: null,
          ),
          Text(' Roads'),
        ]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: _goToPage1, child: Text('To page 1')),
            ElevatedButton(onPressed: _goToPage2, child: Text('To page 2')),
          ],
        ),
      ),
    );
  }
}
