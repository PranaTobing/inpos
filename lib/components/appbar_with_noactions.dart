import 'package:flutter/material.dart';

import '../settings/size_config.dart';

class AppBarWithNoActions extends StatelessWidget with PreferredSizeWidget {
  const AppBarWithNoActions({
    Key? key,
    required this.titlePage,
  }) : super(key: key);

  final String titlePage;

  @override
  Size get preferredSize => Size.fromHeight(getProportionateScreenHeight(65));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titlePage),
    );
  }
}
