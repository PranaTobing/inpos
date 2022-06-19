import 'package:flutter/material.dart';

import '../settings/currency_format.dart';

class TextPaymentButton extends StatelessWidget {
  const TextPaymentButton({
    Key? key,
    required this.total,
    required this.text,
  }) : super(key: key);

  final int total;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          CurrencyFormat.convertToIdr(total, 0),
        ),
        Row(
          children: [
            Text(text),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            )
          ],
        ),
      ],
    );
  }
}
