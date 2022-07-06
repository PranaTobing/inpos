import 'package:flutter/material.dart';
import 'package:inpos/screens/dashboard/header/header_screen.dart';
import 'package:inpos/screens/dashboard/dashboard_widget.dart';
import 'package:inpos/screens/setting_page/setting_page_screen.dart';
import 'package:inpos/settings/constants.dart';
import 'package:inpos/settings/size_config.dart';

import '../components/coming_soon_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static String routeName = '/home';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardWidget(),
    ComingSoon(text: 'Page2: Order History'),
    ComingSoon(text: 'Page3: Order Online'),
    SettingPageScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = _widgetOptions[0];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: const DashboardHeaderWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16),
        ),
        child: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
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
      /*
      bottomNavigationBar: MenuBarWidget(
        selectedPage: _selectedIndex,
        onTap: _onItemTapped,
      ),
      */
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(15),
          ),
          height: getProportionateScreenWidth(60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = _widgetOptions[
                            0]; // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Icon(
                      Icons.home,
                      color: currentTab == 0 ? primaryColor : Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = _widgetOptions[
                            1]; // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Icon(
                      Icons.access_time,
                      color: currentTab == 1 ? primaryColor : Colors.grey,
                    ),
                  )
                ],
              ),
              // right side menu
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = _widgetOptions[
                            2]; // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Icon(
                      Icons.wifi,
                      color: currentTab == 2 ? primaryColor : Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = _widgetOptions[
                            3]; // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Icon(
                      Icons.settings,
                      color: currentTab == 3 ? primaryColor : Colors.grey,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
