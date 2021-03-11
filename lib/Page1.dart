import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:formation/providers/userProvider.dart';
import 'package:provider/provider.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  UserProvider userProvider;

  @override
  void initState() {
    userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );

    firstNameController = TextEditingController(text: userProvider.firstName);
    firstNameController.addListener(() {
      userProvider.firstName = firstNameController.text;
    });

    lastNameController = TextEditingController(text: userProvider.lastName);
    lastNameController.addListener(() {
      userProvider.lastName = lastNameController.text;
    });

    super.initState();
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
          Text(' Page 1'),
        ]),
      ),
      body: Column(
        children: [
          TextField(
            controller: firstNameController,
          ),
          TextField(
            controller: lastNameController,
          ),
        ],
      ),
    );
  }
}
