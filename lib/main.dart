import 'package:flutter/material.dart';
import 'constants.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CoronaVirus PRO',
      theme: ThemeData(
        fontFamily: 'Circular',
        primaryColor: cPrimaryColor,
        scaffoldBackgroundColor: cPrimaryColor,
      ),
      home: HomePage(),
    );
  }
}