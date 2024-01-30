// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class TitleAndDropDownView extends StatelessWidget {
  String title;
  Function(String?) onChange;
  Function onEditingComplete;
  Function onTapSearch;
  bool isSerialNo;
  List<String>? list;
  FocusNode focusNode;
  TitleAndDropDownView({
    super.key,
    required this.title,
    required this.onChange,
    required this.onEditingComplete,
    this.isSerialNo = false,
    this.list,
    required this.focusNode,
    required this.onTapSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: APP_THEME_COLOR, width: 0.3),
      ),
      child: TextFormField(
        focusNode: focusNode,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              onTapSearch();
            },
            icon: const Icon(Icons.search),
          ),
          hintText: title,
          hintStyle: ConfigStyle.regularStyle(14, BLACK_LIGHT),
          contentPadding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
        onChanged: (value) {
          onChange(value);
        },
        onEditingComplete: () {
          onEditingComplete();
        },
      ),
    );
  }
}
