// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/data/vos/asset_data_vo.dart';
import 'package:engineering_project/view/site_item_list/widgets/item_text_row_view.dart';
import 'package:flutter/material.dart';

class AssetDetailDialogView extends StatelessWidget {
  AssetDataVO? asset;
  AssetDetailDialogView({
    required this.asset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: scaleHeight(context) / 2.5,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: MENU_ONE_COLOR,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              Functions.buildBoxShadow(),
            ],
          ),
          child: Column(
            children: [
              ItemTextRowView(
                textTwo: asset?.code ?? "",
                textOne: "Code",
                iconData: Icons.ac_unit,
              ),
              const Spacer(),
              ItemTextRowView(
                textTwo: asset?.name ?? "",
                textOne: "Name",
                iconData: Icons.ac_unit,
              ),
              const Spacer(),
              ItemTextRowView(
                textTwo: asset?.type ?? "",
                textOne: "Type",
                iconData: Icons.ac_unit,
              ),
              const Spacer(),
              ItemTextRowView(
                textTwo: asset?.purchaseDate ?? "",
                textOne: "Purchase Date",
                iconData: Icons.ac_unit,
              ),
              const Spacer(),
              ItemTextRowView(
                textTwo: asset?.useLife?.toString() ?? "",
                textOne: "Use Life",
                iconData: Icons.ac_unit,
              ),
              const Spacer(),
              ItemTextRowView(
                textTwo: asset?.warranty?.toString() ?? "",
                textOne: "Warranty left",
                iconData: Icons.ac_unit,
              ),
              const Spacer(),
              MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: MATERIAL_COLOR,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "OK",
                  style: ConfigStyle.regularStyle(14, MENU_ONE_COLOR),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
