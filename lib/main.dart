import 'package:flutter/material.dart';
import 'package:project1/home/home_screen.dart';
import 'package:project1/home/quran/soura_details_screen.dart';
import 'package:project1/my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SouraDetailsScreen.routeName: (context) => SouraDetailsScreen(),
      },
      theme: MyTheme.lightTheme,
    );
  }
}
