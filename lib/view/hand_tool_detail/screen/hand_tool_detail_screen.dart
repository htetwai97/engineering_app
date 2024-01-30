import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/delivery_detail/widgets/delivery_general_info_view.dart';
import 'package:engineering_project/view/projects/widgets/project_view.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../login/widgets/common_text_field_view.dart';
import '../../request_maintenance/widgets/date_view.dart';
import '../../site_item_list/widgets/item_text_row_view.dart';
import '../bloc/hand_tool_detail_bloc.dart';
import '../widgets/cancel_or_save_view.dart';
import '../widgets/remark_date_view.dart';

class HandToolDetailScreen extends StatelessWidget {
  const HandToolDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HandToolDetailBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Hand Tool Detail",
            style: ConfigStyle.boldStyle(18, MATERIAL_COLOR),
          ),
        ),
        body: Consumer<HandToolDetailBloc>(
          builder: (context, bloc, child) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ItemTextRowView(
                      textOneWidth: 130,
                      iconColor: MENU_FOUR_COLOR,
                      textOneColor: BLACK_HEAVY,
                      textOne: "Name",
                      textTwo: bloc.name ?? "name",
                      iconData: MdiIcons.snowflake,
                    ),
                    const SizedBox(height: 10),
                    ItemTextRowView(
                      textOneWidth: 130,
                      iconColor: MENU_FOUR_COLOR,
                      textOneColor: BLACK_HEAVY,
                      textOne: "Brand",
                      textTwo: bloc.brand ?? "brand",
                      iconData: MdiIcons.snowflake,
                    ),
                    const SizedBox(height: 10),
                    ItemTextRowView(
                      textOneWidth: 130,
                      iconColor: MENU_FOUR_COLOR,
                      textOneColor: BLACK_HEAVY,
                      textOne: "Type",
                      textTwo: bloc.type ?? "type",
                      iconData: MdiIcons.snowflake,
                    ),
                    const SizedBox(height: 10),
                    ItemTextRowView(
                      textOneWidth: 130,
                      iconColor: MENU_FOUR_COLOR,
                      textOneColor: BLACK_HEAVY,
                      textOne: "Specs",
                      textTwo: bloc.specs ?? "specs",
                      iconData: MdiIcons.snowflake,
                    ),
                    const SizedBox(height: 10),
                    ItemTextRowView(
                      textOneWidth: 130,
                      iconColor: MENU_FOUR_COLOR,
                      textOneColor: BLACK_HEAVY,
                      textOne: "Description",
                      textTwo: bloc.description ?? "desc",
                      iconData: MdiIcons.snowflake,
                    ),
                    const SizedBox(height: 10),
                    ItemTextRowView(
                      textOneWidth: 130,
                      iconColor: MENU_FOUR_COLOR,
                      textOneColor: BLACK_HEAVY,
                      textOne: "Qty",
                      textTwo: bloc.qty ?? "qty",
                      iconData: MdiIcons.snowflake,
                    ),
                    const SizedBox(height: 10),
                    ItemTextRowView(
                      textOneWidth: 130,
                      iconColor: MENU_FOUR_COLOR,
                      textOneColor: BLACK_HEAVY,
                      textOne: "Status",
                      textTwo: bloc.status ?? "status",
                      iconData: MdiIcons.snowflake,
                    ),
                    // break
                    const Divider(
                        height: 60,
                        thickness: 2,
                        indent: 10,
                        endIndent: 0,
                        color: Colors.black),
                    const SizedBox(height: 10),
                    RemarkDateView(
                      dateName: bloc.remarkDate ?? "Pick date",
                      onTapDateIcon: () async {
                        final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: bloc.date ?? DateTime.now(),
                            firstDate: DateTime(2021, 3),
                            lastDate: DateTime(2101));
                        bloc.onDatePick(picked!);
                      },
                    ),
                    const SizedBox(height: 30),
                    CommonTextFieldView(
                      renewController: (controller) {},
                      focusNode: bloc.focusNode,
                      numberOnly: true,
                      isFilled: true,
                      isBorderIncluded: true,
                      labelText: "Remark",
                      onChanged: (remark) {
                        bloc.onChangeRemark(remark);
                      },
                      onEditingComplete: () {
                        bloc.onEditingRemarkComplete();
                      },
                    ),
                    const SizedBox(height: 50),
                    CancelOrSaveView(
                      text: "Save",
                      onTapCancel: () {
                        Navigator.pop(context);
                      },
                      onTapSave: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
