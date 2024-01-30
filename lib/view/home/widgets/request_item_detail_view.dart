// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/home/widgets/icon_and_text_request_info_view.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RequestItemDetailView extends StatelessWidget {
  String requestNo, condition, assetName, dueDate;
  Function onTapDetail;
  RequestItemDetailView({
    super.key,
    required this.requestNo,
    required this.condition,
    required this.assetName,
    required this.dueDate,
    required this.onTapDetail,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapDetail();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: MENU_TWO_COLOR,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black12, width: 1),
              boxShadow: [
                Functions.buildBoxShadow(),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconAndTextRequestInfoView(
                      title: requestNo,
                      iconData: Icons.confirmation_number_outlined,
                    ),
                    IconAndTextRequestInfoView(
                      title: assetName,
                      iconData: MdiIcons.slotMachine,
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconAndTextRequestInfoView(
                      title: condition,
                      iconData: Icons.mode_standby_outlined,
                    ),
                    IconAndTextRequestInfoView(
                      title: dueDate,
                      iconData: Icons.calendar_month_outlined,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: -14,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MATERIAL_COLOR,
              ),
            ),
          ),
          Positioned(
            right: -14,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MATERIAL_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
