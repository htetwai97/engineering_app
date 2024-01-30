// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/data/vos/phase_task_vo.dart';
import 'package:engineering_project/view/projects/widgets/phase_task_view.dart';
import 'package:engineering_project/view/request_detail/widgets/two_text_row_view.dart';
import 'package:flutter/material.dart';

import '../../report_project/screen/report_project_screen.dart';

class ProjectView extends StatelessWidget {
  String projectName,
      contactPerson,
      email,
      phone,
      phaseName,
      phaseDescription,
      startDate,
      endDate;
  List<PhaseTaskVO> taskList;
  Function onTapReport;
  ProjectView({
    super.key,
    required this.projectName,
    required this.contactPerson,
    required this.phone,
    required this.email,
    required this.onTapReport,
    required this.phaseName,
    required this.phaseDescription,
    required this.startDate,
    required this.endDate,
    required this.taskList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: MATERIAL_COLOR,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12, width: 1),
        boxShadow: [
          Functions.buildBoxShadow(),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          projectName,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          children: [
            const SizedBox(height: 10),
            ProjectOwnerInfoView(
              title: contactPerson,
              iconData: Icons.person,
            ),
            const SizedBox(height: 4),
            ProjectOwnerInfoView(
              title: phone,
              iconData: Icons.phone,
            ),
            const SizedBox(height: 4),
            ProjectOwnerInfoView(
              title: email,
              iconData: Icons.email,
            ),
          ],
        ),
        children: [
          Container(
            decoration: BoxDecoration(
              color: MATERIAL_COLOR,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black12, width: 1),
              boxShadow: [
                Functions.buildBoxShadow(),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TwoTextRowView(title: "Phase", value: phaseName),
                const SizedBox(height: 4),
                TwoTextRowView(title: "Description", value: phaseDescription),
                const SizedBox(height: 4),
                TwoTextRowView(title: "Start Date", value: startDate),
                const SizedBox(height: 4),
                TwoTextRowView(title: "End Date", value: endDate),
              ],
            ),
          ),
          Visibility(
            visible:
                taskList.length != 0 && taskList != [] && taskList.isNotEmpty,
            child: SizedBox(
              height: 140,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: taskList.length,
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PhaseTaskView(
                    taskName: taskList[index].taskName ?? "",
                    description: taskList[index].description ?? "",
                    startDate: taskList[index].startDate ?? "",
                    endDate: taskList[index].endDate ?? "",
                    onTap: () {
                      Functions.rightToLeftTransition(
                        context,
                        ReportProjectScreen(
                          taskName: taskList[index].taskName ?? "",
                          phaseTaskId: taskList[index].projectPhaseId ?? 0,
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ProjectOwnerInfoView extends StatelessWidget {
  IconData iconData;
  String title;
  ProjectOwnerInfoView({
    super.key,
    required this.iconData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          iconData,
          size: 20,
          color: APP_THEME_COLOR,
        ),
        Text(
          title,
          style: ConfigStyle.regularStyle(
            14,
            APP_THEME_COLOR,
          ),
        )
      ],
    );
  }
}
