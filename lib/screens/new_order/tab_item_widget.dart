import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../settings/constants.dart';
import '../../settings/size_config.dart';

class TabItemWidget extends StatelessWidget {
  const TabItemWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.isActive,
  }) : super(key: key);

  final String icon;
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
      height: getProportionateScreenWidth(90),
      width: getProportionateScreenWidth(80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            getProportionateScreenWidth(8),
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(3, 1),
          )
        ],
        color: isActive ? primaryColor : fgColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            icon,
            height: getProportionateScreenWidth(22),
            width: getProportionateScreenWidth(22),
            color: isActive ? fgColor : colorBlack,
          ),
          Text(
            text,
            style: TextStyle(color: isActive ? fgColor : colorBlack),
          ),
        ],
      ),
    );
  }
}
