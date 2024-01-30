// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class ItemTextRowView extends StatelessWidget {
  String textOne;
  String textTwo;
  IconData iconData;
  Color textOneColor;
  Color textTwoColor;
  Color iconColor;
  double textOneWidth;
  ItemTextRowView({
    super.key,
    required this.textTwo,
    required this.textOne,
    required this.iconData,
    this.textOneColor = MATERIAL_COLOR,
    this.textOneWidth = 100,
    this.iconColor = MATERIAL_COLOR,
    this.textTwoColor = MATERIAL_COLOR,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          iconData,
          size: 20,
          color: iconColor,
        ),
        const SizedBox(width: 4),
        Expanded(
          flex: 2,
          child: Text(
            textOne,
            style: ConfigStyle.regularStyle(
              14,
              textOneColor,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            textTwo,
            style: ConfigStyle.regularStyle(
              14,
              textTwoColor,
            ),
          ),
        ),
      ],
    );
  }
}
