// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MaintenanceOrProjectView extends StatelessWidget {
  String topLeft, topRight, bottomLeft, bottomRight;
  Color progressColor;
  MaintenanceOrProjectView(
      {super.key,
      required this.topLeft,
      required this.topRight,
      required this.progressColor,
      required this.bottomLeft,
      required this.bottomRight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 222, 218, 218),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 0.5),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                topLeft,
                style: ConfigStyle.regularStyle(18, APP_THEME_COLOR),
              ),
              CircularPercentIndicator(
                radius: 22.0,
                lineWidth: 7.0,
                percent: 0.9,
                center: Text(
                  topRight,
                  style: ConfigStyle.regularStyle(10, APP_THEME_COLOR),
                ),
                progressColor: progressColor,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                bottomLeft,
                style: ConfigStyle.regularStyle(18, APP_THEME_COLOR),
              ),
              Text(
                bottomRight,
                style: ConfigStyle.regularStyle(18, APP_THEME_COLOR),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
