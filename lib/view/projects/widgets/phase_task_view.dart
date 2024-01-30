// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PhaseTaskView extends StatelessWidget {
  String taskName, description, startDate, endDate;
  Function onTap;
  PhaseTaskView(
      {super.key,
      required this.taskName,
      required this.description,
      required this.startDate,
      required this.endDate,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 140,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.redAccent, width: 1),
          boxShadow: [
            Functions.buildBoxShadow(),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  MdiIcons.desktopClassic,
                  size: 16,
                  color: Colors.red,
                ),
                const SizedBox(width: 6),
                Text(
                  taskName,
                  style: ConfigStyle.regularStyle(14, BUTTON_COLOR),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  MdiIcons.newspaper,
                  size: 16,
                  color: Colors.red,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    description,
                    style: ConfigStyle.regularStyle(14, BUTTON_COLOR),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  MdiIcons.calendarStart,
                  size: 16,
                  color: Colors.red,
                ),
                const SizedBox(width: 6),
                Text(
                  startDate,
                  style: ConfigStyle.regularStyle(14, BUTTON_COLOR),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  MdiIcons.calendarEnd,
                  size: 16,
                  color: Colors.red,
                ),
                const SizedBox(width: 6),
                Text(
                  endDate,
                  style: ConfigStyle.regularStyle(14, BUTTON_COLOR),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
