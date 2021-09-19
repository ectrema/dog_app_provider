import 'package:dog_app_provider/app/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomNavigationBarProvider>(
      create: (_) => BottomNavigationBarProvider(),
      child: Consumer<BottomNavigationBarProvider>(
        builder: (_, model, child) => Scaffold(
          body: model.currentScreen,
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.login),
                label: 'login',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'dog',
              ),
            ],
            currentIndex: model.currentIndex,
            onTap: (index) {
              model.currentIndex = index;
            },
          ),
        ),
      ),
    );
  }
}
