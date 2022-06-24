import 'package:flutter/material.dart';

import '../../settings/constants.dart';
import '../../settings/currency_format.dart';
import '../../settings/size_config.dart';

class PaymentInstan extends StatelessWidget {
  const PaymentInstan({
    Key? key,
    required this.amount,
    required this.onClick,
  }) : super(key: key);
  final int amount;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(50),
      width: getProportionateScreenWidth(125),
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
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [primaryColor, Color.fromARGB(255, 89, 46, 54)],
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: onClick,
        child: Text(
          CurrencyFormat.convertToIdr(amount, 0),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
