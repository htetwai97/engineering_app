// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/view/login/widgets/common_text_field_view.dart';
import 'package:engineering_project/view/report_request/widgets/camera_or_gallery_view.dart';
import 'package:engineering_project/view/report_request/widgets/date_pick_view.dart';
import 'package:engineering_project/view/request_detail/widgets/two_text_row_view.dart';
import 'package:flutter/material.dart';

class ReportFormView extends StatelessWidget {
  String requestNo;
  String selectedDate;
  Function(DateTime) onPickDate;
  Function(String) onChangeChief;
  Function onEditCompleteChief;
  Function(String) onChangeDescription;
  Function onEditCompleteDescription;
  Function onEditCompleteProgress;
  String progress;
  Function onTapSubmit;
  Function(String) onChangeProgress;
  Function onTapVideo;
  Function onTapPhoto;
  FocusNode? focusNodeChief;
  FocusNode? focusNodeDescription;
  FocusNode? focusNodeProgress;
  List<File> imageList;
  List<File> videoList;
  Function onTapRemovePhoto;
  Function onTapRemoveVideo;
  ReportFormView({
    required this.requestNo,
    required this.selectedDate,
    required this.onPickDate,
    required this.onChangeChief,
    required this.onEditCompleteChief,
    required this.onChangeDescription,
    required this.onEditCompleteDescription,
    required this.progress,
    required this.onChangeProgress,
    required this.onTapPhoto,
    required this.onTapVideo,
    required this.onTapSubmit,
    required this.onEditCompleteProgress,
    required this.focusNodeProgress,
    required this.focusNodeDescription,
    required this.focusNodeChief,
    required this.imageList,
    required this.videoList,
    required this.onTapRemovePhoto,
    required this.onTapRemoveVideo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          TwoTextRowView(
            title: "Request No",
            value: requestNo,
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Text("Finished Date",
                  style: ConfigStyle.regularStyle(14, APP_THEME_COLOR)),
              const Spacer(),
              DatePickView(
                dateName: selectedDate,
                onTapDateIcon: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    onPickDate(picked);
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          CommonTextFieldView(
            renewController: (controller){},
            focusNode: focusNodeChief,
            isFilled: true,
            isBorderIncluded: true,
            labelText: "Chief",
            onChanged: (chief) {
              onChangeChief(chief);
            },
            onEditingComplete: () {
              onEditCompleteChief();
            },
          ),
          const SizedBox(height: 30),
          CommonTextFieldView(
            renewController: (controller){},
            focusNode: focusNodeDescription,
            isFilled: true,
            isBorderIncluded: true,
            labelText: "Description",
            onChanged: (description) {
              onChangeDescription(description);
            },
            onEditingComplete: () {
              onEditCompleteDescription();
            },
          ),
          const SizedBox(height: 30),
          CommonTextFieldView(
            renewController: (controller){},
            focusNode: focusNodeProgress,
            numberOnly: true,
            isFilled: true,
            isBorderIncluded: true,
            labelText: "Progress Percent",
            onChanged: (progress) {
              onChangeProgress(progress);
            },
            onEditingComplete: () {
              onEditCompleteProgress();
            },
          ),
          // TwoTextRowView(
          //   title: "Progress",
          //   value: progress,
          // ),
          // ProgressSliderView(
          //   onChangeValue: (value) {},
          // ),
          const SizedBox(height: 30),
          CameraOrGalleryView(
            length: imageList.length.toString(),
            filePath: "Photo",
            iconData: Icons.photo_outlined,
            onTap: () {
              onTapPhoto();
            },
            onTapRemove: () {
              onTapRemovePhoto();
            },
          ),
          const SizedBox(height: 30),
          CameraOrGalleryView(
            length: videoList.length.toString(),
            filePath: "Video",
            iconData: Icons.video_camera_back_outlined,
            onTap: () {
              onTapVideo();
            },
            onTapRemove: () {
              onTapRemoveVideo();
            },
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: BUTTON_COLOR,
              onPressed: () {
                onTapSubmit();
              },
              child: Text(
                "Submit",
                style: ConfigStyle.regularStyle(
                  14,
                  MATERIAL_COLOR,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
