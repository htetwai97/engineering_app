import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/delivery_detail/screen/delivery_detail_screen.dart';
import 'package:engineering_project/view/delivery_list/widgets/delivery_list_tile_view.dart';
import 'package:flutter/material.dart';

import '../../hand_tool_detail/screen/hand_tool_detail_screen.dart';
import '../widgets/hand_tool_tile_view.dart';

class HandToolListScreen extends StatelessWidget {
  const HandToolListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Hand Tool List",
          style: ConfigStyle.boldStyle(18, MATERIAL_COLOR),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemBuilder: (context, index) {
          return HandToolTileView(
            name: "name",
            quantity: "7",
            onTapReturn: () {
              Functions.transition(context, const HandToolDetailScreen());
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: 5,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
