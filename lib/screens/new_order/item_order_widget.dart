import 'package:flutter/material.dart';

import '../../settings/currency_format.dart';
import '../../settings/size_config.dart';

class ItemOrderWidget extends StatelessWidget {
  const ItemOrderWidget(
      {Key? key, required this.img, required this.harga, required this.title})
      : super(key: key);

  final String img;
  final int harga;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(150),
      width: getProportionateScreenWidth(110),
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
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: getProportionateScreenWidth(90),
              child: Image.asset(img),
            ),
            Text(
              CurrencyFormat.convertToIdr(harga, 0),
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
