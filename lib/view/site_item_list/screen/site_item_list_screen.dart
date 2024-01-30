// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/data/vos/site_product_vo.dart';
import 'package:engineering_project/view/site_item_list/widgets/item_for_site_detail_view.dart';
import 'package:flutter/material.dart';

class SiteItemListScreen extends StatelessWidget {
  SiteProductVO? siteProduct;
  SiteItemListScreen({
    Key? key,
    required this.siteProduct,
  }) : super(key: key);

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
          "Product detail",
          style: ConfigStyle.boldStyle(18, MATERIAL_COLOR),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                height: scaleWidth(context) / 1.2,
                width: scaleWidth(context) / 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      siteProduct?.productImg ?? "",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                siteProduct?.productName ?? "",
                style: ConfigStyle.boldStyle(
                  18,
                  BLACK_HEAVY,
                ),
              ),
              SizedBox(
                height: 20,
                child: Center(
                  child: Container(
                    height: 0.3,
                    color: BLACK_LIGHT,
                  ),
                ),
              ),
              ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemBuilder: (context, index) {
                  var item = siteProduct?.items?[index];
                  return ItemForSiteDetailView(
                    model: item?.model ?? "",
                    serialNo: item?.serialNo ?? "",
                    size: item?.size ?? "",
                    color: item?.color ?? "",
                    dimension: item?.dimension ?? "",
                    specification: item?.otherSpecification ?? "",
                    condition: item?.conditionType?.toString() ?? "",
                    zone: item?.zone ?? "",
                    shelf: item?.shelf ?? "",
                    level: item?.level ?? "",
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: siteProduct?.items?.length ?? 0,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
