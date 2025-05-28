import 'package:flutter/material.dart';
import 'package:todo/loginscreen.dart';
import 'package:todo/waterTracker.dart';

import 'waterTracker.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primaryColor: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.red,
          centerTitle: true
        )
      ) ,
      home: LoginScreen(),
      title: 'Water Tracker',
    );
  }
  
}

