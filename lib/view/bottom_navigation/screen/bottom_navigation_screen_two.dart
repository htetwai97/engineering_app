// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/view/home/screen/home_screen.dart';
import 'package:engineering_project/view/projects/screen/projects_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavigationPageTwo extends StatefulWidget {
  int currentIndex;
  BottomNavigationPageTwo({
    super.key,
    this.currentIndex = 0,
  });

  @override
  State<BottomNavigationPageTwo> createState() =>
      _BottomNavigationPageTwoState();
}

class _BottomNavigationPageTwoState extends State<BottomNavigationPageTwo> {
  late int currentIndex;

  List<GButton> gList = const [
    GButton(
      haptic: true,
      icon: MdiIcons.tools,
      text: "Maintenance",
    ),
    GButton(
      haptic: true,
      icon: MdiIcons.officeBuilding,
      text: "Projects",
    ),
  ];

  List<Widget> screens = [
    HomeScreen(),
    ProjectsScreen(),
  ];
  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: THEME_BODY_COLOR,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14), topRight: Radius.circular(14)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            onTabChange: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            selectedIndex: currentIndex,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            gap: 8,
            color: MATERIAL_COLOR,
            activeColor: APP_THEME_COLOR,
            backgroundColor: Colors.transparent,
            tabBackgroundColor: Colors.white,
            tabs: gList,
          ),
        ),
      ),
    );
  }
}
