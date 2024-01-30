// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_style.dart';

class BtnView extends StatelessWidget {
  String btnName;
  Function onTouch;
  double verticalPadding;
  double horizontalPadding;
  BtnView({
    super.key,
    required this.btnName,
    required this.onTouch,
    this.horizontalPadding = 30,
    this.verticalPadding = 4,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () {
          onTouch();
        },
        child: Chip(
          labelPadding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          backgroundColor: LOGIN_BUTTON_COLOR,
          label: Text(
            btnName,
            style: ConfigStyle.regularStyle(14, MATERIAL_COLOR),
          ),
        ),
      ),
    );
  }
}
