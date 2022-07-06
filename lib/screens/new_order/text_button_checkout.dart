import 'package:flutter/material.dart';

import '../../settings/currency_format.dart';

class TextCheckoutButton extends StatelessWidget {
  const TextCheckoutButton({
    Key? key,
    required this.total,
    required this.totalItem,
  }) : super(key: key);

  final int total;
  final int totalItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              CurrencyFormat.convertToIdr(total, 0),
            ),
            const SizedBox(
              width: 12,
            ),
            Text('($totalItem item)')
          ],
        ),
        Row(
          children: const [
            Text('Periksa Kembali'),
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
