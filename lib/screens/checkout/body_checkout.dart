import 'package:flutter/material.dart';
import 'package:inpos/settings/constants.dart';

import '../../settings/currency_format.dart';
import '../../settings/size_config.dart';

class BodyCheckout extends StatelessWidget {
  const BodyCheckout(
      {Key? key,
      required this.img,
      required this.titleItem,
      required this.totalItem,
      required this.harga,
      required this.substractFunc,
      required this.addFunc,
      required this.deleteFunc})
      : super(key: key);

  final String img;
  final String titleItem;
  final int totalItem;
  final int harga;
  final VoidCallback substractFunc;
  final VoidCallback addFunc;
  final VoidCallback deleteFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 50, maxHeight: 100),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(10),
            horizontal: getProportionateScreenWidth(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.12),
                        blurRadius: 8,
                        offset: const Offset(3, 1),
                      )
                    ],
                  ),
                  height: getProportionateScreenWidth(40),
                  child: Image.asset(img),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(titleItem),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: substractFunc,
                          icon: const Icon(
                            Icons.remove_circle,
                            color: primaryColor,
                          ),
                        ),
                        Text('$totalItem'),
                        IconButton(
                          onPressed: addFunc,
                          icon: const Icon(
                            Icons.add_circle,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      CurrencyFormat.convertToIdr(totalItem * harga, 0),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: deleteFunc,
                      icon: const Icon(
                        Icons.cancel_rounded,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
