import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
 String _firstName;
 String _lastName;

 set firstName(String firstname) {
   _firstName = firstname;
   notifyListeners();
 }

 set lastName(String lastName) {
   _lastName = lastName;
   notifyListeners();
 }

 get firstName => _firstName;
 get lastName => _lastName;
}
