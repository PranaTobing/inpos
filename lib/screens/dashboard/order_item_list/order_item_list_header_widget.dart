import 'package:flutter/material.dart';
import 'package:inpos/settings/size_config.dart';

import 'order_item_constants.dart';

class HeaderOrderedItemList extends StatelessWidget {
  const HeaderOrderedItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          orderedItemLabel1,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          width: getProportionateScreenWidth(5),
        ),
        const Text(
          orderedItemLabel2,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
        ),
      ],
    );
  }
}
