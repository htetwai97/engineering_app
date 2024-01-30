// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/material_request_history/widgets/request_material_view.dart';
import 'package:flutter/material.dart';
import '../../../data/vos/products.dart';

class RequestProductView extends StatelessWidget {
  String requestDate, reason, requestedBy;
  List<Products> materialList;

  RequestProductView({
    super.key,
    required this.requestDate,
    required this.reason,
    required this.requestedBy,
    required this.materialList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MATERIAL_COLOR,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12, width: 1),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          requestDate,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          children: [
            const SizedBox(height: 10),
            RequestInfoView(
              title: "Request by :",
              text: requestedBy,
            ),
            const SizedBox(height: 4),
            RequestInfoView(
              title: "Reason :",
              text: reason,
            ),
          ],
        ),
        children: [
          Visibility(
            visible: materialList.isNotEmpty,
            child: Container(
              alignment: Alignment.centerLeft,
              height: 100,
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shrinkWrap: true,
                itemCount: materialList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => RequestMaterialView(
                  name: materialList[index].name ?? "",
                  quantity: materialList[index].quantity != null
                      ? "${materialList[index].quantity}"
                      : "0",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RequestInfoView extends StatelessWidget {
  String title, text;
  RequestInfoView({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: ConfigStyle.regularStyle(
            16,
            APP_THEME_COLOR,
          ),
        ),
        Text(
          text,
          style: ConfigStyle.regularStyle(
            14,
            BLACK_HEAVY,
          ),
        )
      ],
    );
  }
}
