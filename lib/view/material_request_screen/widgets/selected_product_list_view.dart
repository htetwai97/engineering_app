// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/data/vos/product_vo.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SelectedProductListView extends StatefulWidget {
  List<ProductVO>? selectedProductList;
  SelectedProductListView({
    super.key,
    required this.selectedProductList,
  });

  @override
  State<SelectedProductListView> createState() =>
      _SelectedProductListViewState();
}

class _SelectedProductListViewState extends State<SelectedProductListView> {
  int _position = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 130,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                if (index.isEven) {
                  _position = 0;
                } else {
                  _position = 1;
                }
              });
            },

            ///aspectRatio: 16 / 9,
            viewportFraction: 0.6,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
          ),
          items: widget.selectedProductList?.map((product) {
            return Container(
              width: 210,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 0.4),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 0.2,
                    color: Colors.black12,
                    offset: Offset(0, 0),
                    blurRadius: 30,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Material",
                        style: ConfigStyle.regularStyle(14, BLACK_HEAVY),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        MdiIcons.screwLag,
                        size: 16,
                        color: THEME_BODY_COLOR,
                      ),
                      const Spacer(),
                      Text(
                        "${product.productName}",
                        style: ConfigStyle.regularStyle(14, BLACK_HEAVY),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Quantity",
                        style: ConfigStyle.regularStyle(14, BLACK_HEAVY),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        MdiIcons.numeric,
                        size: 16,
                        color: THEME_BODY_COLOR,
                      ),
                      const Spacer(),
                      Text(
                        "(${product.quantity ?? 0})",
                        style: ConfigStyle.regularStyle(14, BLACK_HEAVY),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 20,
          child: DotsIndicator(
            dotsCount: 2,
            position: _position,
            decorator: const DotsDecorator(
              color: Colors.grey,
              activeColor: LOGIN_BUTTON_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}
