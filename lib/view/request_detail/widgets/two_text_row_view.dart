// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class TwoTextRowView extends StatelessWidget {
  String title;
  String value;
  Color valueColor;
  TwoTextRowView({
    super.key,
    required this.title,
    required this.value,
    this.valueColor = BLACK_LIGHT,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            "$title : ",
            style: ConfigStyle.regularStyle(14, APP_THEME_COLOR),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: ConfigStyle.regularStyle(14, valueColor),
          ),
        ),
      ],
    );
  }
}
