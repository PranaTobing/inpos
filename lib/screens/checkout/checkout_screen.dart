import 'package:flutter/material.dart';

import '../../components/appbar_with_actions.dart';
import '../../components/bottom_widget.dart';
import '../../settings/size_config.dart';
import 'body_checkout.dart';
import 'data_checkout.dart';
import 'text_button_payment.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  static String routeName = '/checkout';

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late double totalSum = 345000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithActions(
        titlePage: 'Checkout',
        actions: [
          {'onPressed': () {}, 'icon': Icons.delete},
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(10),
          horizontal: getProportionateScreenWidth(20),
        ),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: listCheckout.length,
            itemBuilder: (BuildContext ctx, int index) {
              return BodyCheckout(
                img: listCheckout[index]['img'],
                titleItem: listCheckout[index]['title'],
                totalItem: listCheckout[index]['totalItem'].toDouble(),
                harga: listCheckout[index]['harga'].toDouble(),
              );
            }),
      ),
      bottomSheet: BottomWidget(
        onPressed: () {
          // Navigator.pushNamed(context, CheckoutScreen.CheckoutScreen.routeName);
        },
        child: TextPaymentButton(total: totalSum.toInt()),
      ),
    );
  }
}
