import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formation/providers/userProvider.dart';
import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (_, userProvider, __) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Welcome page'),
            ),
            body: Column(
              children: [
                Text(
                  userProvider.firstName ?? 'no firstName',
                ),
                Text(
                  userProvider.lastName ?? 'no lastName',
                ),
              ],
            ));
      },
    );
  }
}
