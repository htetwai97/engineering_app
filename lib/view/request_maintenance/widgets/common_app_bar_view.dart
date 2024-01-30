// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_config/config_style.dart';

class CommonAppBarView extends StatelessWidget {
  String title;
  bool automaticImply;
  Function onTapBack;
  bool isEnableBack;
  CommonAppBarView({
    super.key,
    required this.title,
    required this.onTapBack,
    this.automaticImply = false,
    this.isEnableBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: automaticImply,
      backgroundColor: THEME_EXTREMITY_COLOR,
      leading: (isEnableBack)
          ? IconButton(
              onPressed: () {
                onTapBack();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: WHITE_COLOR,
              ),
            )
          : null,
      title: Text(
        title,
        style: ConfigStyle.boldStyle(
          FONT_MEDIUM,
          WHITE_COLOR,
        ),
      ),
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     icon: const Icon(
      //       Icons.more_vert,
      //       size: FONT_LARGE + 4,
      //     ),
      //   ),
      // ],
    );
  }
}
