import 'dart:io';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inpos/bloc/checkout/checkout_bloc.dart';
import 'package:inpos/bloc/payment_cash/payment_cash_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../blue_thermal/print_receipt.dart';
import '../../components/appbar_with_noactions.dart';
import '../../components/bottom_widget.dart';
import '../../components/text_button_payment.dart';
import '../../models/payment_cash.dart';
import '../../settings/size_config.dart';
import '../new_order/new_order_screen.dart';
import 'payment_cash_body.dart';
import 'payment_constants.dart';
import 'payment_wallet_bank_grid.dart';
import 'tab_payment_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.totalCheckout})
      : super(key: key);
  final int totalCheckout;

  static String routeName = '/payment';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late int _activeTab = 0;

  BluetoothDevice device = BluetoothDevice(
    'namecontoh',
    'addresscontoh',
  );
  BlueThermalPrinter printer = BlueThermalPrinter.instance;
  String? pathImage;
  PrintReceipt? printReceipt;

  String? name;
  String? address;

  Future<void> getPreference() async {
    final localData = await SharedPreferences.getInstance();

    if (localData.containsKey('key-is-bluetooth-saved')) {
      name = localData.getString('key-bluetooth-name');
      address = localData.getString('key-bluetooth-address');
      device = BluetoothDevice(name, address);
      printer.connect(device);
    }
  }

  initSavetoPath() async {
    var bytes =
        await rootBundle.load("assets/images/logo_jabarindo_200_bw.jpg");
    String dir = (await getApplicationDocumentsDirectory()).path;
    const filename = 'logo_jabarindo_200_bw.jpg';
    writeToFile(bytes, '$dir/$filename');
    setState(() {
      pathImage = '$dir/$filename';
    });
  }

  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    super.initState();
    initSavetoPath();
    printReceipt = PrintReceipt();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CheckoutBloc myCheckout = context.read<CheckoutBloc>();
    PaymentCashBloc myPayment = context.read<PaymentCashBloc>();

    return Scaffold(
      appBar: const AppBarWithNoActions(titlePage: 'Pembayaran'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
          ),
          child: Container(
            height: SizeConfig.screenHeight * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                tabBarMethod(),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      PaymentCashBody(subTotal: widget.totalCheckout),
                      GridBuilderPaymentBankWallet(listData: paymentBanks),
                      GridBuilderPaymentBankWallet(listData: paymentEWallets),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BlocBuilder<CheckoutBloc, CheckoutState>(
        bloc: myCheckout,
        builder: (context, checkoutState) {
          if (checkoutState is CheckoutLoaded && _activeTab == 0) {
            return BlocBuilder<PaymentCashBloc, PaymentCashState>(
              bloc: myPayment,
              builder: (context, paymentCashState) {
                if (paymentCashState is PaymentCashLoaded &&
                    paymentCashState.payment.change >= 0) {
                  return FutureBuilder(
                    future: getPreference(),
                    builder: (context, _) => BottomWidget(
                      onPressed: () async {
                        await printReceipt!.content(
                          pathImage!,
                          paymentCashState.payment.subTotal,
                          paymentCashState.payment.tax,
                          paymentCashState.payment.total,
                          paymentCashState.payment.cash,
                          paymentCashState.payment.change,
                          checkoutState.products,
                        );

                        showDialog<String>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Pembayaran Sukses!'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    'Cetak Ulang untuk cetak ulang struk dan Menu Pesanan untuk melakukan pemesanan baru'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    TextButton(
                                        child: const Text(
                                          'Cetak Ulang',
                                        ),
                                        onPressed: () {
                                          printReceipt!.content(
                                            pathImage!,
                                            paymentCashState.payment.subTotal,
                                            paymentCashState.payment.tax,
                                            paymentCashState.payment.total,
                                            paymentCashState.payment.cash,
                                            paymentCashState.payment.change,
                                            checkoutState.products,
                                          );
                                        }),
                                    TextButton(
                                      child: const Text(
                                        'Menu Pesanan',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      onPressed: () {
                                        // delete state checkout and paymentcash
                                        myCheckout.add(
                                            const DeleteAllCheckoutData(
                                                products: []));
                                        myPayment.add(const ResetPaymentCash(
                                          payment: PaymentCash(
                                            subTotal: 0,
                                            cash: 0,
                                          ),
                                        ));
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BlocProvider.value(
                                              value: myCheckout,
                                              child: const NewOrderScreen(),
                                            ),
                                          ),
                                          ModalRoute.withName('/home'),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: TextPaymentButton(
                        total: paymentCashState.payment.total.toInt(),
                        text: 'Cetak Struk',
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Padding tabBarMethod() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(5),
      ),
      child: TabBar(
        onTap: (index) {
          setState(() {
            _activeTab = tabController.index;
          });
        },
        indicatorColor: Colors.transparent,
        controller: tabController,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(8),
        ),
        tabs: tabPayments
            .map(
              (payment) => TabPaymentWidget(
                icon: payment['icon'],
                text: payment['title'],
                isActive: _activeTab == payment['id'],
              ),
            )
            .toList(),
      ),
    );
  }
}
