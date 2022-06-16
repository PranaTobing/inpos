import 'package:flutter/material.dart';

import 'item_order_widget.dart';

class GridBuilderItemWidget extends StatelessWidget {
  const GridBuilderItemWidget({
    Key? key,
    required this.listData,
  }) : super(key: key);

  final List<Map> listData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: listData.length,
      itemBuilder: (BuildContext ctx, index) {
        return ItemOrderWidget(
          img: listData[index]['img'],
          harga: listData[index]['harga'],
          title: listData[index]['title'],
        );
      },
    );
  }
}
