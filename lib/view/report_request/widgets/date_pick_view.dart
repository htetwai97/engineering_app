// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_function/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_config/config_style.dart';

class DatePickView extends StatelessWidget {
  String dateName;
  Function onTapDateIcon;

  DatePickView({
    super.key,
    required this.dateName,
    required this.onTapDateIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: scaleWidth(context) / 20,
        vertical: scaleWidth(context) / 65,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: dateName,
              style: ConfigStyle.regularStyle(14, BLACK_LIGHT),
            ),
            WidgetSpan(
              child: Padding(
                padding: EdgeInsets.only(left: scaleWidth(context) / 10),
                child: InkWell(
                  onTap: () {
                    onTapDateIcon();
                  },
                  child: const Icon(Icons.calendar_month,
                      color: Colors.green, size: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
