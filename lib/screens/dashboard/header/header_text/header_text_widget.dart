import 'package:flutter/material.dart';

import '../../../../settings/constants.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({
    Key? key,
    required this.title,
    required this.isSubHeader,
  }) : super(key: key);

  final String title;
  final bool isSubHeader;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: primaryColor, fontSize: isSubHeader ? 14 : 18),
    );
  }
}
