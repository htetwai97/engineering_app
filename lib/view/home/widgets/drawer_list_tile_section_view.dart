// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class DrawerListTileSectionView extends StatefulWidget {
  IconData icon;
  String text;
  Function onTap;
  DrawerListTileSectionView({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  State<DrawerListTileSectionView> createState() =>
      _DrawerListTileSectionViewState();
}

class _DrawerListTileSectionViewState extends State<DrawerListTileSectionView> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        widget.onTap();
      },
      selectedColor: Colors.green,
      dense: true,
      style: ListTileStyle.drawer,
      leading: Icon(
        widget.icon,
        color: APP_THEME_COLOR,
        size: FONT_XLARGE - 2,
      ),
      title: Text(
        widget.text,
        style: ConfigStyle.regularStyle(
          FONT_MEDIUM,
          APP_THEME_COLOR,
        ),
      ),
    );
  }
}
