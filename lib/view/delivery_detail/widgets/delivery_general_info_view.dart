// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/view/site_item_list/widgets/item_text_row_view.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DeliveryGeneralInfoView extends StatelessWidget {
  String deliNo;
  String deliDate;
  String project;
  String phase;
  DeliveryGeneralInfoView({
    super.key,
    required this.deliDate,
    required this.deliNo,
    required this.project,
    required this.phase,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
      ),
      child: Column(
        children: [
          ItemTextRowView(
            textOneWidth: 130,
            iconColor: MENU_FOUR_COLOR,
            textOneColor: BLACK_HEAVY,
            textOne: "Delivery No",
            textTwo: deliNo,
            textTwoColor: BLACK_HEAVY,
            iconData: MdiIcons.truckDeliveryOutline,
          ),
          ItemTextRowView(
            textOneWidth: 130,
            iconColor: MENU_FOUR_COLOR,
            textOneColor: BLACK_HEAVY,
            textOne: "Delivery Date",
            textTwo: deliDate,
            textTwoColor: BLACK_HEAVY,
            iconData: MdiIcons.calendar,
          ),
          ItemTextRowView(
            textOneWidth: 130,
            iconColor: MENU_FOUR_COLOR,
            textOneColor: BLACK_HEAVY,
            textOne: "Project",
            textTwo: project,
            textTwoColor: BLACK_HEAVY,
            iconData: MdiIcons.projectorScreen,
          ),
          ItemTextRowView(
            textOneWidth: 130,
            iconColor: MENU_FOUR_COLOR,
            textOneColor: BLACK_HEAVY,
            textOne: "Phase",
            textTwo: phase,
            textTwoColor: BLACK_HEAVY,
            iconData: MdiIcons.ladder,
          ),
        ],
      ),
    );
  }
}
