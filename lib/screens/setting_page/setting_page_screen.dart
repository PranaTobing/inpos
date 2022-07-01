import 'package:flutter/material.dart';
import 'package:inpos/screens/setting_page/setting_bluetooth_device.dart';
import 'package:inpos/settings/constants.dart';

class SettingPageScreen extends StatelessWidget {
  const SettingPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BluetoothDeviceSetting(),
                ));
              },
              splashColor: primaryColor,
              child: const ListTile(
                title: Text('Bluetooth device'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
