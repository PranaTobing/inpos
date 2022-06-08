import 'package:flutter/material.dart';
import 'package:inpos/screens/main_screen.dart';
import 'package:inpos/settings/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inpos Application Demo',
      theme: ThemeData(
        primaryColor: bgColor,
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
