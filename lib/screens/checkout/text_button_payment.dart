import 'package:flutter/material.dart';

import '../../settings/currency_format.dart';

class TextPaymentButton extends StatelessWidget {
  const TextPaymentButton({
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
            Text('Continue to Payment'),
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
