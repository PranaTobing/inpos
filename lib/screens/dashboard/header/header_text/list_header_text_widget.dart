import 'package:flutter/material.dart';

import '../header_constants.dart';
import 'header_text_widget.dart';

final List<Widget> listHeaderText = [
  const HeaderTextWidget(
    title: textHeader1,
    isSubHeader: false,
  ),
  const HeaderTextWidget(
    title: textHeader2,
    isSubHeader: true,
  ),
];
