// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/home/widgets/drawer_list_tile_section_view.dart';
import 'package:engineering_project/view/menu/screen/menu_screen.dart';
import 'package:flutter/material.dart';

class DrawerPropertyListView extends StatelessWidget {
  bool visibleHome;
  DrawerPropertyListView({
    super.key,
    this.visibleHome = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          height: 160,
          color: APP_THEME_COLOR,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: MATERIAL_COLOR, width: 1),
                ),
                child: const Center(
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "User Name",
                style: ConfigStyle.boldStyle(
                  15,
                  MATERIAL_COLOR,
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: visibleHome,
          child: DrawerListTileSectionView(
            icon: Icons.home_filled,
            text: "Home",
            onTap: () {
              Functions.transition(context, const MenuScreen());
            },
          ),
        ),
        DrawerListTileSectionView(
          icon: Icons.person,
          text: "Profile",
          onTap: () {},
        ),
        DrawerListTileSectionView(
          icon: Icons.settings,
          text: "Settings",
          onTap: () {},
        ),
        DrawerListTileSectionView(
          icon: Icons.logout,
          text: "Log out",
          onTap: () {},
        ),
        // DrawerListTileSectionView(
        //   icon: MdiIcons.fanAlert,
        //   text: "Request Form",
        //   onTap: () {
        //     Functions.replacementTransition(
        //         context, const RequestMaintenanceScreen());
        //   },
        // ),
      ],
    );
  }
}
