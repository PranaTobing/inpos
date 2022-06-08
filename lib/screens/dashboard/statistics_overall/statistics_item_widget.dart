import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../settings/constants.dart';
import '../../../settings/size_config.dart';

class StatItemWidget extends StatelessWidget {
  const StatItemWidget({
    Key? key,
    required this.icon,
    required this.totalRevanue,
    required this.titleItem,
  }) : super(key: key);
  final String icon;
  final String totalRevanue;
  final String titleItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(120),
      width: getProportionateScreenWidth(80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            getProportionateScreenWidth(8),
          ),
        ),
        color: primaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenWidth(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              icon,
              color: fgColor,
              width: getProportionateScreenWidth(25),
              height: getProportionateScreenWidth(25),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            textStatItem(text: titleItem, isSubText: true),
            textStatItem(text: totalRevanue, isSubText: false),
          ],
        ),
      ),
    );
  }

  Expanded textStatItem({required String text, required bool isSubText}) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(
            color: fgColor,
            fontWeight: isSubText ? FontWeight.w600 : FontWeight.w300,
            fontSize: 12),
      ),
    );
  }
}
