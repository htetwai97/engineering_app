// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class CameraOrGalleryView extends StatelessWidget {
  String filePath;
  IconData iconData;
  Function onTap;
  String length;
  Function onTapRemove;
  CameraOrGalleryView({
    super.key,
    required this.filePath,
    required this.iconData,
    required this.onTap,
    required this.length,
    required this.onTapRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Text(
                    filePath,
                    style: ConfigStyle.regularStyle(
                      14,
                      APP_THEME_COLOR,
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black38,
                  ),
                  child: Center(
                    child: Text(
                      length,
                      style: ConfigStyle.regularStyle(
                        14,
                        MATERIAL_COLOR,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Visibility(
              visible: length != "0",
              child: IconButton(
                onPressed: () {
                  onTapRemove();
                },
                icon: const Icon(
                  Icons.highlight_remove_outlined,
                  color: Colors.red,
                  size: 22,
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                onTap();
              },
              icon: Icon(
                iconData,
                color: APP_THEME_COLOR,
                size: 30,
              ),
            ),
          ],
        ),
        Container(
          height: 0.2,
          width: double.infinity,
          color: APP_THEME_COLOR,
        )
      ],
    );
  }
}
