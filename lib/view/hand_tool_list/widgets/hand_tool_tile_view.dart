// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HandToolTileView extends StatelessWidget {
  String? name, quantity;
  Function onTapReturn;
  HandToolTileView({
    super.key,
    required this.name,
    required this.quantity,
    required this.onTapReturn,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      style: ListTileStyle.drawer,
      dense: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: BLACK_LIGHT,
          width: 0.4,
        ),
      ),
      leading: Column(
        children: [
          const Icon(
            MdiIcons.tools,
            color: MENU_THREE_COLOR,
          ),
          const Spacer(),
          Text(
            name ?? "",
            style: ConfigStyle.regularStyle(
              14,
              BLACK_HEAVY,
            ),
          ),
        ],
      ),
      title: Column(
        children: [
          const Icon(
            MdiIcons.numeric,
            color: MENU_ONE_COLOR,
          ),
          const SizedBox(height: 10),
          Text(
            quantity ?? "",
            style: ConfigStyle.regularStyle(
              14,
              BLACK_HEAVY,
            ),
          ),
        ],
      ),
      trailing: InkWell(
        onTap: () {
          onTapReturn();
        },
        child: const Text(
          "Return",
          style: TextStyle(
            color: APP_THEME_COLOR,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
