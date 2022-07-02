import 'package:flutter/material.dart';
import 'package:inpos/screens/dashboard/header/header_screen.dart';
import 'package:inpos/screens/dashboard/dashboard_widget.dart';
import 'package:inpos/screens/setting_page/setting_page_screen.dart';
import 'package:inpos/settings/constants.dart';
import 'package:inpos/settings/size_config.dart';

import '../components/coming_soon_widget.dart';
import 'navigation_bar/menu_bar_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static String routeName = '/home';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardWidget(),
    ComingSoon(text: 'Page2: Order History'),
    ComingSoon(text: 'Page3: Order Online'),
    SettingPageScreen(),
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16),
        ),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: MenuBarWidget(
        selectedPage: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.qr_code_scanner,
          size: 32.0,
        ),
      ),
    );
  }
}
