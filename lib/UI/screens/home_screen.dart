import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_project/provider/app_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: provider.bottomScreens[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home ), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.view_comfy_alt_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
        currentIndex: provider.currentIndex,
        onTap: (index){
          provider.changeBottomNav(index);
        },
        iconSize: 30,

      ),
    );
  }
}
