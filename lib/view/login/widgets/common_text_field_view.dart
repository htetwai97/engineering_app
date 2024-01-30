// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

class CommonTextFieldView extends StatefulWidget {
  String labelText;
  String? predefinedText;
  Function(String) onChanged;
  Function onEditingComplete;
  Function(TextEditingController) renewController;
  FocusNode? focusNode;
  bool visibleEye;
  bool isBorderIncluded;
  bool isFilled;
  bool numberOnly;
  CommonTextFieldView({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.focusNode,
    required this.onEditingComplete,
    this.predefinedText,
    this.visibleEye = false,
    this.isBorderIncluded = false,
    this.isFilled = false,
    this.numberOnly = false,
    required this.renewController,
  });

  @override
  State<CommonTextFieldView> createState() => _CommonTextFieldViewState();
}

class _CommonTextFieldViewState extends State<CommonTextFieldView> {
  var myController = TextEditingController();
  FocusNode? focusNode = FocusNode();
  late bool secure;
  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.visibleEye) {
        secure = true;
      } else {
        secure = false;
      }
      myController.text = widget.predefinedText ?? "";
      focusNode = widget.focusNode;
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.transparent, width: 0.2),
    );
    var focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.transparent, width: 0.2),
    );
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: APP_THEME_COLOR, width: 0.2),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurStyle: BlurStyle.outer,
            blurRadius: 20,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: myController,
        obscureText: secure,
        onChanged: (text) {
          widget.onChanged(text);
        },
        onEditingComplete: () {
          widget.onEditingComplete();
          widget.renewController(myController);
        },
        decoration: InputDecoration(
          enabledBorder: (!widget.isBorderIncluded) ? null : enabledBorder,
          focusedBorder: (!widget.isBorderIncluded) ? null : focusedBorder,
          filled: widget.isFilled,
          fillColor: TEXT_FIELD_COLOR,
          suffixIcon: Visibility(
            visible: widget.visibleEye,
            child: IconButton(
              onPressed: () {
                setState(() {
                  secure = !secure;
                });
              },
              icon: Icon(
                secure ? Icons.visibility : Icons.visibility_off,
                size: 28,
              ),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: scaleWidth(context) / 80,
            horizontal: scaleWidth(context) / 10,
          ),
          isDense: true,
          hintText: widget.labelText,
          hintStyle: ConfigStyle.regularStyle(
            FONT_MEDIUM,
            BLACK_LIGHT,
          ),
          border: (!widget.isBorderIncluded)
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: BLACK_LIGHT,
                  ),
                )
              : const OutlineInputBorder(),
        ),
        keyboardType:
            widget.numberOnly ? TextInputType.number : TextInputType.text,
        style: const TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}
