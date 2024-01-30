// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_dimens.dart';
import '../../../core/core_config/config_style.dart';

class DropDownView extends StatefulWidget {
  String? selectedValue;
  List<String> list;
  String? menuTitle;
  Function(String?) onChange;
  DropDownView({
    super.key,
    this.list = const ["one", "two", "three", "four"],
    this.menuTitle,
    this.selectedValue,
    required this.onChange,
  });

  @override
  State<DropDownView> createState() => _DropDownViewState();
}

class _DropDownViewState extends State<DropDownView> {
  String? dropdownValue;
  String? menuTitle;
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        alignment: Alignment.centerLeft,
        value: item,
        child: Text(
          item,
          style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_LIGHT),
        ),
      );

  @override
  void initState() {
    setState(() {
      menuTitle = widget.menuTitle;
      dropdownValue = widget.selectedValue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(
      //     left: scaleHeight(context) / 12,
      //     top: scaleHeight(context) / 60,
      //     bottom: scaleHeight(context) / 60),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: TEXT_FIELD_COLOR,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black26, width: 0.6),
      ),
      child: Row(
        children: [
          Text(
            (dropdownValue != null && dropdownValue != "")
                ? dropdownValue!
                : menuTitle ?? "Choose Something",
            style: ConfigStyle.regularStyle(FONT_MEDIUM, BLACK_HEAVY),
          ),
          DropdownButton<String>(
              underline: Container(
                color: Colors.transparent,
              ),
              isDense: true,
              isExpanded: false,
              elevation: 0,
              dropdownColor: Colors.white,
              value: null,
              items: widget.list.map(buildMenuItem).toList(),
              onChanged: (value) {
                setState(() {
                  dropdownValue = value;
                  menuTitle = null;
                  widget.onChange(dropdownValue);
                });
              }),
        ],
      ),
    );
  }
}
