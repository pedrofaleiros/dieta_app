import 'package:flutter/material.dart';

class InputController with ChangeNotifier {
  String? _email;
  String? _password;

  FocusNode passwordFocusNode = FocusNode();

  String get email => _email ?? '';
  String get password => _password ?? '';

  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  set password(String? value) {
    _password = value;
    notifyListeners();
  }
}
