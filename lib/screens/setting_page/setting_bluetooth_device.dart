import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:inpos/settings/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:inpos/settings/size_config.dart';

class BluetoothDeviceSetting extends StatefulWidget {
  const BluetoothDeviceSetting({Key? key}) : super(key: key);

  @override
  State<BluetoothDeviceSetting> createState() => _BluetoothDeviceStateSetting();
}

class _BluetoothDeviceStateSetting extends State<BluetoothDeviceSetting> {
  List<BluetoothDevice> devices = [];
  BluetoothDevice? selectedDevices = BluetoothDevice(
    'name',
    'address',
  );
  BlueThermalPrinter printer = BlueThermalPrinter.instance;

  String? name;
  String? address;

  Future<void> setPreference() async {
    final localData = await SharedPreferences.getInstance();

    if (localData.containsKey('key-is-bluetooth-saved')) {
      localData.clear();
    }

    localData.setString('key-is-bluetooth-saved', 'saved');
    localData.setString('key-bluetooth-name', name.toString());
    localData.setString('key-bluetooth-address', address.toString());
    setState(() {});
  }

  Future<void> getPreference() async {
    final localData = await SharedPreferences.getInstance();

    if (localData.containsKey('key-is-bluetooth-saved')) {
      name = localData.getString('key-bluetooth-name');
      address = localData.getString('key-bluetooth-address');

      selectedDevices = BluetoothDevice(
        name,
        address,
      );
    }
  }

  @override
  void initState() {
    selectedDevices;
    super.initState();
    getDevices();
  }

  void getDevices() async {
    devices = await printer.getBondedDevices();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPreference(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: const Text('Bluetooth Device'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: SizeConfig.screenWidth,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<BluetoothDevice>(
                      value: selectedDevices,
                      hint: const Text('Select Thermal Printer'),
                      onChanged: (device) {
                        name = device!.name;
                        address = device.address;
                        selectedDevices =
                            BluetoothDevice(device.name, device.address);
                        setPreference();
                      },
                      items: devices
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name!),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: getProportionateScreenWidth(40),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: primaryColor),
                        onPressed: () {
                          if (selectedDevices!.name != null) {
                            setPreference();
                            const snackBar = SnackBar(
                              content: Text(
                                'Berhasil menyimpan Bluetooth Device Printer',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: (primaryColor),
                              duration: Duration(milliseconds: 500),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            const snackBar = SnackBar(
                              content: Text(
                                'Error! Harap pilih Bluetooth terlebih dahulu!',
                                style: TextStyle(color: Colors.red),
                              ),
                              backgroundColor: (Colors.white),
                              duration: Duration(milliseconds: 500),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: const Text('Simpan')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
