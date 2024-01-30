// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RequestMaterialView extends StatelessWidget {
  String name, quantity;
  RequestMaterialView({
    super.key,
    required this.name,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blueAccent, width: 1),
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
                color: Colors.blueAccent,
              ),
              const SizedBox(width: 6),
              Text(
                name,
                style: ConfigStyle.regularStyle(14, BUTTON_COLOR),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(
                MdiIcons.newspaper,
                size: 16,
                color: Colors.blueAccent,
              ),
              const SizedBox(width: 6),
              Text(
                quantity,
                style: ConfigStyle.regularStyle(14, BUTTON_COLOR),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
