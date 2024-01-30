// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_config/config_style.dart';

class CancelOrSaveView extends StatelessWidget {
  Function onTapSave;
  Function onTapCancel;
  String text;
  CancelOrSaveView({
    super.key,
    required this.onTapCancel,
    required this.onTapSave,
    this.text = "Save",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              onTapCancel();
            },
            child: Container(
              color: LOGIN_BUTTON_COLOR,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                "Cancel",
                style: ConfigStyle.boldStyle(15, MATERIAL_COLOR),
              ),
            ),
          ),
          const SizedBox(
            width: 70,
          ),
          InkWell(
            onTap: () {
              onTapSave();
            },
            child: Container(
              color: LOGIN_BUTTON_COLOR,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                text,
                style: ConfigStyle.boldStyle(15, MATERIAL_COLOR),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
