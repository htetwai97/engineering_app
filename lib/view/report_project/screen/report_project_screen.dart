// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/history/screen/history_screen.dart';
import 'package:engineering_project/view/report_project/bloc/report_project_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../widgets/project_report_form.dart';

class ReportProjectScreen extends StatelessWidget {
  int phaseTaskId;
  String taskName;
  ReportProjectScreen(
      {Key? key, required this.phaseTaskId, required this.taskName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReportProjectBloc(phaseTaskId),
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
            "Report Tasks",
            style: ConfigStyle.boldStyle(18, MATERIAL_COLOR),
          ),
        ),
        body: Selector<ReportProjectBloc, bool>(
            builder: (context, isLoading, child) {
              if (isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Selector<ReportProjectBloc, bool>(
                    builder: (context, isApiCalling, child) {
                      return Stack(
                        children: [
                          SingleChildScrollView(
                            child: Consumer<ReportProjectBloc>(
                              builder: (context, bloc, child) =>
                                  ProjectReportForm(
                                taskName: taskName,
                                imageList: bloc.photoList,
                                videoList: bloc.videoList,
                                focusNodeDescription: bloc.focusNodeDescription,
                                focusNodeChief: bloc.focusNodeChief,
                                focusNodeProgress: bloc.focusNodeProgress,
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
                                  bloc.onTapSubmit().then((value) {
                                    Functions.transition(
                                        context, const HistoryScreen());
                                  });
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
