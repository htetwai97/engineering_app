// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_config/config_style.dart';

class DueDateView extends StatelessWidget {
  String? dueDate;
  String? dayOfWeek;
  int? dayOfMonth;
  Function onTap;
  DueDateView({
    super.key,
    required this.dueDate,
    required this.onTap,
  }) {
    DateTime date = DateTime.parse(dueDate!);
    dayOfWeek = DateFormat.E().format(DateTime.now());
    dayOfMonth = date.day;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        width: scaleWidth(context) / 6,
        child: Column(
          children: [
            Text(
              dayOfWeek!,
              style: ConfigStyle.regularStyle(
                15,
                MATERIAL_COLOR,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              dayOfMonth.toString(),
              style: ConfigStyle.boldStyle(
                18,
                MATERIAL_COLOR,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
