import 'package:flutter/material.dart';

import '../../settings/size_config.dart';

class PaymentEWalletBody extends StatelessWidget {
  const PaymentEWalletBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(70),
      width: getProportionateScreenWidth(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            getProportionateScreenWidth(5),
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(3, 1),
          )
        ],
        color: Colors.red,
      ),
    );
  }
}
