// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_config/config_style.dart';

class RemarkDateView extends StatelessWidget {
  String dateName;
  Function onTapDateIcon;

  RemarkDateView({
    super.key,
    required this.dateName,
    required this.onTapDateIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(context) / 20,
          vertical: scaleWidth(context) / 40),
      decoration: BoxDecoration(
        color: TEXT_FIELD_COLOR,
        borderRadius: BorderRadius.circular(12),
      ),
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(
            text: dateName,
            style: ConfigStyle.boldStyle(FONT_LARGE - 5, BLACK_LIGHT),
          ),
          WidgetSpan(
              child: Padding(
            padding: EdgeInsets.only(left: scaleWidth(context) / 2.2),
            child: InkWell(
              onTap: () {
                onTapDateIcon();
              },
              child: const Icon(Icons.calendar_month,
                  color: Colors.green, size: 25),
            ),
          ))
        ],
      )),
    );
  }
}
