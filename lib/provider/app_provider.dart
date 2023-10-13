import 'package:flutter/cupertino.dart';
import 'package:quiz_project/UI/screens/calender_screen.dart';
import 'package:quiz_project/UI/screens/items_screen.dart';
import 'package:quiz_project/UI/screens/main_screen.dart';
import 'package:quiz_project/UI/screens/user_screen.dart';

class AppProvider extends ChangeNotifier{
  int currentIndex = 0;

  List<Widget> bottomScreens = [
    MainScreen(),
    ItemsScreen(),
    CalenderScreen(),
    const UserScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<String> items = [
    "Discover",
    "News",
    "Most Viewed",
    "Saved",
  ];

  int current = 0;
  void refresh(int index){
    current = index;
    notifyListeners();
  }
}