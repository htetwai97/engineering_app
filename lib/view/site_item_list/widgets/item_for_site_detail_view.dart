// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/site_item_list/widgets/item_text_row_view.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ItemForSiteDetailView extends StatelessWidget {
  String model;
  String serialNo;
  String size;
  String color;
  String dimension;
  String specification;
  String condition;
  String zone;
  String shelf;
  String level;
  double padding;
  bool visibleExtraData;
  Color boxColor;

  ItemForSiteDetailView({
    super.key,
    required this.condition,
    required this.size,
    required this.color,
    required this.dimension,
    required this.level,
    required this.model,
    required this.serialNo,
    required this.shelf,
    required this.specification,
    required this.zone,
    this.padding = 10,
    this.visibleExtraData = true,
    this.boxColor = MENU_ONE_COLOR,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12, width: 1),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemTextRowView(
            textOne: "Model",
            textTwo: model,
            iconData: MdiIcons.factoryIcon,
          ),
          Visibility(
            visible: visibleExtraData,
            child: ItemTextRowView(
              textOne: "Serial No",
              textTwo: serialNo,
              iconData: MdiIcons.numeric,
            ),
          ),
          Visibility(
            visible: visibleExtraData,
            child: ItemTextRowView(
              textOne: "Size",
              textTwo: size,
              iconData: Icons.donut_small_outlined,
            ),
          ),
          Visibility(
            visible: visibleExtraData,
            child: ItemTextRowView(
              textOne: "Color",
              textTwo: color,
              iconData: Icons.color_lens_outlined,
            ),
          ),
          Visibility(
            visible: visibleExtraData,
            child: ItemTextRowView(
              textOne: "Dimension",
              textTwo: dimension,
              iconData: MdiIcons.applicationArrayOutline,
            ),
          ),
          Visibility(
            visible: visibleExtraData,
            child: ItemTextRowView(
              textOne: "Specification",
              textTwo: specification,
              iconData: Icons.details,
            ),
          ),
          Visibility(
            visible: visibleExtraData,
            child: ItemTextRowView(
              textOne: "Condition",
              textTwo: condition,
              iconData: Icons.security_update_warning_outlined,
            ),
          ),
          Visibility(
            visible: visibleExtraData,
            child: ItemTextRowView(
              textOne: "Zone",
              textTwo: zone,
              iconData: Icons.place,
            ),
          ),
          Visibility(
            visible: visibleExtraData,
            child: ItemTextRowView(
              textOne: "Shelf",
              textTwo: shelf,
              iconData: MdiIcons.bookshelf,
            ),
          ),
          Visibility(
            visible: visibleExtraData,
            child: ItemTextRowView(
              textOne: "Level",
              textTwo: level,
              iconData: MdiIcons.hydraulicOilLevel,
            ),
          ),
        ],
      ),
    );
  }
}
