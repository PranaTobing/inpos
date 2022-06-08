import 'package:flutter/material.dart';

import '../../../settings/size_config.dart';
import 'statistics_item_widget.dart';
import 'statistics_overall_constants.dart';

class StatsOverallWidget extends StatelessWidget {
  const StatsOverallWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          StatItemWidget(
            icon: revanueIcon,
            totalRevanue: ravanueNumberText,
            titleItem: ravanueText,
          ),
          StatItemWidget(
            icon: orderIcon,
            totalRevanue: orderNumberText,
            titleItem: orderText,
          ),
          StatItemWidget(
            icon: dineInIcon,
            totalRevanue: dineInNumberText,
            titleItem: dineInText,
          ),
          StatItemWidget(
            icon: onlineOrderIcon,
            totalRevanue: onlineOrderNumberText,
            titleItem: onlineOrderText,
          ),
        ],
      ),
    );
  }
}
