import 'package:flutter/material.dart';
import 'package:inpos/models/product_model.dart';
import 'package:inpos/settings/size_config.dart';

import 'item_order_widget.dart';

class GridBuilderItemWidget extends StatelessWidget {
  const GridBuilderItemWidget({
    Key? key,
    required this.listData,
  }) : super(key: key);

  final List<Product> listData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: getProportionateScreenWidth(35)),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: listData.length,
      itemBuilder: (BuildContext ctx, index) {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3)),
          child: ItemOrderWidget(product: listData[index]),
        );
      },
    );
  }
}
