import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_project/UI/screens/home_screen.dart';
import 'package:quiz_project/provider/app_provider.dart';
import 'package:quiz_project/style/themes.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => AppProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

