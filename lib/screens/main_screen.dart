import 'package:flutter/material.dart';
import 'package:inpos/screens/dashboard/header/header_screen.dart';
import 'package:inpos/settings/size_config.dart';

import 'navigation_bar/menu_bar_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Page1: Dashboard',
      style: optionStyle,
    ),
    Text(
      'Page2: Online Order',
      style: optionStyle,
    ),
    Text(
      'Page3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: const DashboardHeaderWidget(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: MenuBarWidget(
        selectedPage: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
