// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/data/vos/product_vo.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatefulWidget {
  ProductDetailView({
    super.key,
    required this.product,
    required this.onChecked,
  });

  ProductVO? product;
  Function(bool) onChecked;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  var value = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
            ///"https://media.wired.com/photos/631bb97dd884b4dcc94164e3/master/w_2560%2Cc_limit/How-to-Choose-a-Laptop-Gear-GettyImages-1235728903.jpg",

            "http://192.168.100.21:8000/images/${widget.product?.productImg}",
            width: 120,
            fit: BoxFit.cover,
          ),
          Text(
            ///"Name",

            widget.product?.productName ?? "",
            style: ConfigStyle.regularStyle(
              14,
              BLACK_HEAVY,
            ),
          ),
          Checkbox(
            value: value,
            onChanged: (newValue) {
              setState(() {
                value = newValue ?? false;
                widget.onChecked(newValue ?? false);
              });
            },
          ),
        ],
      ),
    );
  }
}
