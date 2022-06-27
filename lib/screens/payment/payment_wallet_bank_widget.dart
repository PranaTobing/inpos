import 'package:flutter/material.dart';

import '../../settings/size_config.dart';

class PaymentWalletBank extends StatelessWidget {
  const PaymentWalletBank({
    Key? key,
    required this.img,
  }) : super(key: key);
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(0),
      width: getProportionateScreenWidth(0),
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
        color: Colors.white,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.all(Colors.blueAccent.withOpacity(0.3)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: () {},
        child: Image.asset(
          img,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
