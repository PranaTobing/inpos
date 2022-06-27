import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:intl/intl.dart';

import '../models/product_checkout.dart';

class PrintReceipt {
  BlueThermalPrinter printer = BlueThermalPrinter.instance;
  final now = DateTime.now();
  int totalQty = 0;

  content(
    String pathImage,
    double subTotal,
    double tax,
    double total,
    double cash,
    double change,
    List<ProductCheckout> products,
  ) async {
    if ((await printer.isConnected)!) {
      printer.printNewLine();
      printer.printImage(pathImage);
      printer.printNewLine();
      printer.printNewLine();
      printer.printCustom("KAFE UMKM CABANG X", 3, 1);
      printer.printCustom("JL. NAMA JALAN NO.21", 1, 1);
      printer.printCustom("BANDUNG - JAWA BARAT", 1, 1);
      printer.printNewLine();
      printer.printCustom('Kasir: Nama Kasir', 0, 2);
      printer.printCustom('================================', 1, 1);
      printer.printCustom(DateFormat('dd-MM-yyyy HH:mm:ss').format(now), 0, 2);

      for (var product in products) {
        totalQty += product.totalOrderItem;
        printer.printLeftRight('${product.totalOrderItem} ${product.title}',
            '${product.harga * product.totalOrderItem}', 1,
            format: "%-15s %15s %n");
      }
      printer.printLeftRight('item: ${products.length}', 'total: $totalQty', 0);
      printer.printNewLine();
      printer.printLeftRight('Sub Total', '${subTotal.toInt()}', 1,
          format: "%-15s %15s %n");
      printer.printLeftRight('Pajak (11%)', '${tax.toInt()}', 1,
          format: "%-15s %15s %n");
      printer.printLeftRight('Total', '${total.toInt()}', 1,
          format: "%-15s %15s %n");
      printer.printLeftRight('Nominal', '${cash.toInt()}', 1,
          format: "%-15s %15s %n");
      printer.printLeftRight('Kembalian', '${change.toInt()}', 1,
          format: "%-15s %15s %n");
      printer.printNewLine();
      printer.printCustom('================================', 1, 1);
      printer.printLeftRight("LEFT", "RIGHT", 1, format: "%-15s %15s %n");
      printer.printCustom("TERIMA KASIH", 1, 1);
      printer.printCustom("Selamat Menikmati", 1, 1);
      printer.printNewLine();
      printer.paperCut();
    }

    // printer.connect(_device!).catchError((error) {
    //   print('error connected: $error')
    // });
  }
}
