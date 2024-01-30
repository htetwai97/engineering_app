// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/view/report_request/bloc/report_request_bloc.dart';
import 'package:engineering_project/view/report_request/widgets/report_form_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ReportRequestScreen extends StatelessWidget {
  String requestNO;
  int requestId;
  ReportRequestScreen({
    Key? key,
    required this.requestNO,
    required this.requestId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReportRequestBloc(requestId),
      child: Scaffold(
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
            "Report Request",
            style: ConfigStyle.boldStyle(18, MATERIAL_COLOR),
          ),
        ),
        body: Selector<ReportRequestBloc, bool>(
            builder: (context, isLoading, child) {
              if (isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Selector<ReportRequestBloc, bool>(
                    builder: (context, isApiCalling, child) {
                      return Stack(
                        children: [
                          SingleChildScrollView(
                            child: Consumer<ReportRequestBloc>(
                              builder: (context, bloc, child) => ReportFormView(
                                imageList: bloc.photoList,
                                videoList: bloc.videoList,
                                focusNodeDescription: bloc.focusNodeDescription,
                                focusNodeChief: bloc.focusNodeChief,
                                focusNodeProgress: bloc.focusNodeProgress,
                                requestNo: requestNO,
                                selectedDate: bloc.date ?? "",
                                onPickDate: (date) {
                                  final formatter = DateFormat('yyyy-MM-dd');
                                  var dateString = formatter.format(date);
                                  bloc.onPickedDate(dateString);
                                },
                                onChangeChief: (chief) {
                                  bloc.onChangeChief(chief);
                                },
                                onEditCompleteChief: () {
                                  bloc.onEditCompleteChief();
                                },
                                onChangeDescription: (description) {
                                  bloc.onChangeDescription(description);
                                },
                                onEditCompleteDescription: () {
                                  bloc.onEditCompleteDescription();
                                },
                                progress: "80%",
                                onChangeProgress: (value) {
                                  bloc.onChangeProgress(value);
                                },
                                onEditCompleteProgress: () {
                                  bloc.onEditCompleteProgress();
                                },
                                onTapPhoto: () async {
                                  var result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.image,
                                    allowMultiple: false,
                                  );
                                  var platFormFile = result?.files.first;
                                  if (platFormFile != null) {
                                    bloc.onPickedImage(
                                      File(platFormFile.path ?? ""),
                                    );
                                  }
                                },
                                onTapVideo: () async {
                                  var result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.video,
                                    allowMultiple: false,
                                  );
                                  var platFormFile = result?.files.first;
                                  if (platFormFile != null) {
                                    bloc.onPickedVideo(
                                      File(platFormFile.path ?? ""),
                                    );
                                  }
                                },
                                onTapRemovePhoto: () {
                                  bloc.onTapRemovePhoto();
                                },
                                onTapRemoveVideo: () {
                                  bloc.onTapRemoveVideo();
                                },
                                onTapSubmit: () {
                                  bloc.onTapSubmit();
                                },
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isApiCalling,
                            child: const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.transparent,
                                color: Colors.amber,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    selector: (context, bloc) => bloc.isApiCalling);
              }
            },
            selector: (context, bloc) => bloc.isLoading),
      ),
    );
  }
}
