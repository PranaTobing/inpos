import 'package:flutter/material.dart';

import '../../../settings/size_config.dart';
import '../order_item_list/order_item_list_widget.dart';
import 'statistics_overall_list_widget.dart';

class StatsOverallWidget extends StatelessWidget {
  const StatsOverallWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(20),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const StatsOverallList(),
            SizedBox(
              height: getProportionateScreenWidth(30),
            ),
            const OrderItemListWidget(),
          ],
        ));
  }
}
