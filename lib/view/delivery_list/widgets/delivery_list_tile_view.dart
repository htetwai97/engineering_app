// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class DeliveryListTileView extends StatelessWidget {
  String? title;
  String? leading;
  Function onTapDetail;
  DeliveryListTileView({
    super.key,
    required this.title,
    required this.leading,
    required this.onTapDetail,
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
      leading: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: MENU_ONE_COLOR,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Deliver No",
              style: ConfigStyle.regularStyle(
                14,
                MATERIAL_COLOR,
              ),
            ),
            const Spacer(),
            Text(
              leading ?? "",
              style: ConfigStyle.regularStyle(
                14,
                MATERIAL_COLOR,
              ),
            ),
          ],
        ),
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: MENU_FIVE_COLOR,
        ),
        child: Column(
          children: [
            Text(
              "Date",
              style: ConfigStyle.regularStyle(
                14,
                MATERIAL_COLOR,
              ),
            ),
            Text(
              title ?? "",
              style: ConfigStyle.regularStyle(
                14,
                MATERIAL_COLOR,
              ),
            ),
          ],
        ),
      ),
      trailing: InkWell(
        onTap: () {
          onTapDetail();
        },
        child: const Text(
          "Detail",
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
