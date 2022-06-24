import 'package:flutter/material.dart';

import '../../settings/constants.dart';
import '../../settings/size_config.dart';

class EmptyDataCheckout extends StatelessWidget {
  const EmptyDataCheckout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Silahkan Kembali\nke Halaman Order',
        style: TextStyle(
            fontSize: getProportionateScreenWidth(30), color: primaryColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
