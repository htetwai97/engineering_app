// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/view/request_maintenance/widgets/btn_view.dart';
import 'package:flutter/material.dart';

class SearchAssetListTileView extends StatelessWidget {
  String name;
  String code;
  Function onTapRequest;
  Function onTapDetail;
  SearchAssetListTileView({
    super.key,
    required this.name,
    required this.code,
    required this.onTapRequest,
    required this.onTapDetail,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      style: ListTileStyle.drawer,
      dense: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: BLACK_LIGHT,
          width: 0.4,
        ),
      ),
      leading: Text(
        code,
        style: ConfigStyle.regularStyle(
          14,
          BLACK_HEAVY,
        ),
      ),
      title: Column(
        children: [
          Text(
            name,
            style: ConfigStyle.regularStyle(
              14,
              BLACK_HEAVY,
            ),
          ),
          const SizedBox(height: 20),
          BtnView(
            horizontalPadding: 10,
            verticalPadding: 2,
            btnName: "Request",
            onTouch: () {
              onTapRequest();
            },
          ),
        ],
      ),
      trailing: InkWell(
        onTap: () {
          onTapDetail();
        },
        child: const Text(
          "detail",
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
