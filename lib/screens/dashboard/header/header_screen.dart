import 'package:flutter/material.dart';
import 'package:inpos/settings/constants.dart';
import 'package:inpos/settings/size_config.dart';

import 'header_constants.dart';
import 'header_new_order/list_action_header.dart';
import 'header_text/header_title_widget.dart';

class DashboardHeaderWidget extends StatelessWidget with PreferredSizeWidget {
  const DashboardHeaderWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(getProportionateScreenHeight(65));

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      leading: Image.asset(
        leadingHeader,
      ),
      title: const TitleWidget(),
      actions: actionList,
      elevation: 0,
    );
  }
}
