import 'package:flutter/material.dart';
import 'package:inpos/settings/size_config.dart';

import 'payment_wallet_bank_widget.dart';

class GridBuilderPaymentBankWallet extends StatelessWidget {
  const GridBuilderPaymentBankWallet({
    Key? key,
    required this.listData,
  }) : super(key: key);

  final List<Map<String, dynamic>> listData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: getProportionateScreenWidth(35)),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1 / .5),
      itemCount: listData.length,
      itemBuilder: (BuildContext ctx, index) {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3)),
          child: PaymentWalletBank(img: listData[index]['img']),
        );
      },
    );
  }
}
