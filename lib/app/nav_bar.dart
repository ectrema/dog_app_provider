import 'package:dog_app_provider/ui/dog/dog_view.dart';
import 'package:dog_app_provider/ui/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Widget get currentScreen => screen[currentIndex];

  List<Widget> screen = [
    Login(),
    DogView(),
  ];
}
