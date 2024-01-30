// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:flutter/material.dart';

class AgreeTermsAndCondition extends StatefulWidget {
  Function(bool) onCheck;
  bool enableCheck;
  AgreeTermsAndCondition({
    super.key,
    required this.onCheck,
    this.enableCheck = false,
  });

  @override
  State<AgreeTermsAndCondition> createState() => _AgreeTermsAndConditionState();
}

class _AgreeTermsAndConditionState extends State<AgreeTermsAndCondition> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          side: const BorderSide(color: Colors.white, width: 2),
          checkColor: MATERIAL_COLOR,
          fillColor: MaterialStateProperty.all(LOGIN_BUTTON_COLOR),
          value: value,
          onChanged: (e) {
            if (widget.enableCheck) {
              setState(() {
                value = e ?? false;
                widget.onCheck(e ?? false);
              });
            }
          },
        ),
        SizedBox(
          width: scaleWidth(context) / 40,
        ),
        const Text(
          "Agree the terms and conditions.",
          style: TextStyle(
            color: MATERIAL_COLOR,
            fontWeight: FontWeight.w500,
            fontSize: FONT_MEDIUM,
          ),
        )
      ],
    );
  }
}
