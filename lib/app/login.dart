import 'package:flutter/foundation.dart';

class LoginProvider with ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String get password => _password;
  
  set password(String password) {
    _password = password;
    notifyListeners();
  }

  bool get correctEmail => validateEmailAddress(_email);
  bool get correctPassword => validatePassword(_password);

  bool validateEmailAddress(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  bool validatePassword(String password) {
    return password.length >= 8;
  }
}
