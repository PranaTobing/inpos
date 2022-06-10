import 'package:flutter/material.dart';
import 'package:inpos/settings/size_config.dart';

import 'order_item_constants.dart';
import 'order_item_list_header_widget.dart';

class OrderItemListWidget extends StatelessWidget {
  const OrderItemListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: const HeaderOrderedItemList(),
        ),
        SizedBox(
          height: getProportionateScreenWidth(10),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: createColumn(),
            rows: createRow(),
          ),
        ),
      ],
    );
  }
}
