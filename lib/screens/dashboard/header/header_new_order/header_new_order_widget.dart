import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../settings/size_config.dart';
import '../header_constants.dart';

class NewOrderWidget extends StatelessWidget {
  const NewOrderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
      ),
      child: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            newOrderHeader,
            width: 30,
          )),
    );
  }
}
