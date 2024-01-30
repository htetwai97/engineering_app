// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class IconAndTextRequestInfoView extends StatelessWidget {
  String title;
  IconData iconData;
  IconAndTextRequestInfoView({
    super.key,
    required this.title,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: scaleWidth(context) / 3,
      child: Column(
        children: [
          Icon(
            iconData,
            size: 22,
            color: BLACK_HEAVY,
          ),
          Text(
            title,
            style: ConfigStyle.regularStyle(
              14,
              BLACK_HEAVY,
            ),
          ),
        ],
      ),
    );
  }
}
