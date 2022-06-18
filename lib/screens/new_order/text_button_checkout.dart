import 'package:flutter/material.dart';

import '../../settings/currency_format.dart';

class TextCheckoutButton extends StatelessWidget {
  const TextCheckoutButton({
    Key? key,
    required this.total,
  }) : super(key: key);

  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          CurrencyFormat.convertToIdr(total, 0),
        ),
        Row(
          children: const [
            Text('Checkout'),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
            )
          ],
        ),
      ],
    );
  }
}
