// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class ProductListTileForSiteView extends StatelessWidget {
  String? url;
  String? title;
  int? quantity;
  Function onTapDetail;
  ProductListTileForSiteView({
    super.key,
    required this.title,
    required this.quantity,
    required this.url,
    required this.onTapDetail,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      style: ListTileStyle.drawer,
      dense: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: BLACK_LIGHT,
          width: 0.4,
        ),
      ),
      leading: Container(
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              url ??
                  "https://cdn.thewirecutter.com/wp-content/media/2023/06/laptops-2048px-5607.jpg?auto=webp&quality=75&crop=1.91:1&width=1200",
            ),
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title ?? "",
            style: ConfigStyle.regularStyle(
              14,
              BLACK_HEAVY,
            ),
          ),
          Text(
            quantity != null ? "$quantity" : "0",
            style: ConfigStyle.regularStyle(
              14,
              BLACK_HEAVY,
            ),
          ),
        ],
      ),
      trailing: InkWell(
        onTap: () {
          onTapDetail();
        },
        child: const Text(
          "detail",
          style: TextStyle(
            color: APP_THEME_COLOR,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
