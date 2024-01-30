// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:flutter/material.dart';

class MenuItemDetailView extends StatelessWidget {
  Color boxColor;
  Color circleColor;
  String? text;
  Function onTap;
  MenuItemDetailView({
    super.key,
    required this.boxColor,
    required this.text,
    this.circleColor = BLACK_LIGHT,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String t = text?.substring(0, 1).toUpperCase() ?? "";
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: scaleWidth(context) / 2.1,
        width: scaleWidth(context) / 2.34,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: boxColor,
          border: Border.all(color: Colors.black12, width: 0.3),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            Functions.buildBoxShadow(),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleColor,
              ),
              child: Center(
                child: Text(
                  t,
                  style: ConfigStyle.boldStyle(
                    24,
                    MATERIAL_COLOR,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              child: Text(
                text ?? "",
                style: ConfigStyle.boldStyle(
                  16,
                  MATERIAL_COLOR,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
