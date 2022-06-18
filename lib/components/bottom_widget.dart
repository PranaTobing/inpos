import 'package:flutter/material.dart';

import '../settings/constants.dart';
import '../settings/size_config.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16),
          vertical: getProportionateScreenWidth(15)),
      child: SizedBox(
        width: double.infinity,
        height: getProportionateScreenWidth(48),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: primaryColor),
            onPressed: onPressed,
            child: child),
      ),
    );
  }
}
