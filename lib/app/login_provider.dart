import 'package:dog_app_provider/service/login_service.dart';
import 'package:flutter/foundation.dart';

class LoginProvider with ChangeNotifier {
  final LoginService loginService;
  String _email = '';
  String _password = '';
  String? token;

  LoginProvider({required this.loginService});

  Future<void> login() async {
    var temp = await loginService.postLogin(_email, _password);
    token = temp['token'];
    notifyListeners();
  }

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
