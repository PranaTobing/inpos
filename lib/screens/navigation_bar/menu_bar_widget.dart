import 'package:flutter/material.dart';

import '../../settings/constants.dart';
import 'navigation_constant.dart';

class MenuBarWidget extends StatelessWidget {
  const MenuBarWidget(
      {Key? key, required this.selectedPage, required this.onTap})
      : super(key: key);
  final int selectedPage;
  final Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        menuBarItem(icon: Icons.home, label: dashboard),
        menuBarItem(icon: Icons.access_time, label: history),
        menuBarItem(icon: Icons.wifi, label: onlineOrder),
        menuBarItem(icon: Icons.settings, label: settings),
      ],
      currentIndex: selectedPage,
      unselectedIconTheme: const IconThemeData(color: colorNotSelected),
      selectedIconTheme: const IconThemeData(color: colorSelected),
      selectedItemColor: colorSelected,
      unselectedItemColor: colorNotSelected,
      onTap: onTap,
    );
  }

  BottomNavigationBarItem menuBarItem(
      {required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
