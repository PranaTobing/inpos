import 'package:flutter/material.dart';

import '../settings/constants.dart';
import '../settings/size_config.dart';

class AppBarWithActions extends StatelessWidget with PreferredSizeWidget {
  const AppBarWithActions({
    Key? key,
    required this.titlePage,
    required this.actions,
  }) : super(key: key);

  final String titlePage;
  final List<Map<String, dynamic>> actions;

  @override
  Size get preferredSize => Size.fromHeight(getProportionateScreenHeight(65));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titlePage),
      actions: actions
          .map(
            (action) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
              ),
              child: IconButton(
                onPressed: action['onPressed'],
                icon: Icon(
                  action['icon'],
                  color: primaryColor,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
