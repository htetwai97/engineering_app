import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/bottom_navigation/screen/bottom_navigation_screen_two.dart';
import 'package:engineering_project/view/delivery_list/screen/delivery_list_screen.dart';
import 'package:engineering_project/view/home/widgets/custom_app_bar_view.dart';
import 'package:engineering_project/view/home/widgets/drawer_property_list_view.dart';
import 'package:engineering_project/view/material_request_history/screen/material_request_history_screen.dart';
import 'package:engineering_project/view/menu/widgets/menu_item_detail_view.dart';
import 'package:engineering_project/view/request_maintenance/screen/request_maintenance_screen.dart';
import 'package:engineering_project/view/search_asset/screen/search_asset_screen.dart';
import 'package:engineering_project/view/site_inventory/screen/site_inventory_screen.dart';
import 'package:flutter/material.dart';

import '../../hand_tool_list/screen/hand_tool_list_screen.dart';
import '../../history/screen/history_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          drawer: Drawer(
            width: scaleWidth(context) / 1.4,
            child: DrawerPropertyListView(visibleHome: false),
          ),
          appBar: PreferredSize(
            preferredSize: Size(scaleWidth(context), 60),
            child: CustomAppBarView(
              visibleDueDates: false,
              title: "Menu",
              onTap: (date) {},
              dueDateList: [],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuItemDetailView(
                        boxColor: APP_THEME_COLOR,
                        text: "Maintenance List",
                        onTap: () {
                          Functions.rightToLeftTransition(
                              context, BottomNavigationPageTwo());
                        },
                      ),
                      MenuItemDetailView(
                        boxColor: APP_THEME_COLOR,
                        text: "Project List",
                        onTap: () {
                          Functions.rightToLeftTransition(
                              context,
                              BottomNavigationPageTwo(
                                currentIndex: 1,
                              ));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuItemDetailView(
                        boxColor: APP_THEME_COLOR,
                        text: "Report History",
                        onTap: () {
                          Functions.transition(context, const HistoryScreen());
                        },
                      ),
                      MenuItemDetailView(
                        boxColor: APP_THEME_COLOR,
                        text: "Maintenance Request Form",
                        onTap: () {
                          Functions.transition(
                              context, RequestMaintenanceScreen());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuItemDetailView(
                        boxColor: APP_THEME_COLOR,
                        text: "Search Asset",
                        onTap: () {
                          Functions.rightToLeftTransition(
                              context, const SearchAssetScreen());
                        },
                      ),
                      MenuItemDetailView(
                        boxColor: APP_THEME_COLOR,
                        text: "Requested Material List",
                        onTap: () {
                          Functions.rightToLeftTransition(
                              context, const MaterialRequestHistoryScreen());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuItemDetailView(
                        boxColor: APP_THEME_COLOR,
                        text: "Site Inventory",
                        onTap: () {
                          Functions.rightToLeftTransition(
                              context, const SiteInventoryScreen());
                        },
                      ),
                      MenuItemDetailView(
                        boxColor: APP_THEME_COLOR,
                        text: "Delivery List",
                        onTap: () {
                          Functions.rightToLeftTransition(
                              context, const DeliveryListScreen());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuItemDetailView(
                        boxColor: APP_THEME_COLOR,
                        text: "Hand Tools",
                        onTap: () {
                          Functions.rightToLeftTransition(
                              context, const HandToolListScreen());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
