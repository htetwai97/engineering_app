// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ProgressSliderView extends StatefulWidget {
  Function(double) onChangeValue;
   ProgressSliderView({
    super.key,
     required this.onChangeValue,
  });

  @override
  State<ProgressSliderView> createState() => _ProgressSliderViewState();
}

class _ProgressSliderViewState extends State<ProgressSliderView> {
  double value = 1;
  @override
  Widget build(BuildContext context) {
    return Slider(
      label: value.toInt().toString(),
      max: 100,
      divisions: 100,
      value: value,
      onChanged: (newValue) {
        setState(() {
          value = newValue;
          widget.onChangeValue(newValue);
        });
      },
    );
  }
}
