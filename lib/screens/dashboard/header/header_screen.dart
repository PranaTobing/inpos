import 'package:flutter/material.dart';
import 'package:inpos/settings/size_config.dart';

import 'header_constants.dart';
import 'header_new_order/list_action_header.dart';
import 'header_text/header_title_widget.dart';

class DashboardHeaderWidget extends StatelessWidget with PreferredSizeWidget {
  const DashboardHeaderWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(getProportionateScreenHeight(75));

  @override
  Padding build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
      ),
      child: AppBar(
        leading: Transform.translate(
          offset: const Offset(30, 0),
          child: Image.asset(
            leadingHeader,
          ),
        ),
        titleSpacing: 30,
        title: const TitleWidget(),
        actions: actionList,
      ),
    );
  }
}
