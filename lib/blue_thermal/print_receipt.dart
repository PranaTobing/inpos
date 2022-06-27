import 'dart:io';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class PrintReceipt {
  BlueThermalPrinter printer = BlueThermalPrinter.instance;

  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  content() async {
    var bytes = await rootBundle.load("assets/images/logo_jabarindo_100.png");
    String dir = (await getApplicationDocumentsDirectory()).path;
    const filename = 'logo_jabarindo_100.png';
    writeToFile(bytes, '$dir/$filename');
    String pathImage = '$dir/$filename';
    // BluetoothDevice device = BluetoothDevice(
    //   n
    // );

    // printer.connect(_device!).catchError((error) {
    //   print('error connected: $error')
    // });
  }
}
