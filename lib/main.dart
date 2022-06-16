import 'package:flutter/material.dart';
import 'package:inpos/screens/main_screen.dart';
import 'package:inpos/settings/constants.dart';
import 'package:inpos/settings/routes.dart';

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
        primaryColor: primaryColor,
        appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: primaryColor),
            titleTextStyle: TextStyle(color: primaryColor, fontSize: 18)),
      ),
      initialRoute: MainScreen.routeName,
      routes: routes,
    );
  }
}
