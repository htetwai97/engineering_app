import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/site_item_list/widgets/item_text_row_view.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../bloc/history_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HistoryBloc(),
      child: DefaultTabController(
        length: 2,
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
              "History",
              style: ConfigStyle.boldStyle(18, MATERIAL_COLOR),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Consumer<HistoryBloc>(
                builder: (context, bloc, child) => TabBar(
                  onTap: (int index) {
                    //change the listToShow
                    bloc.onTabChanged(index);
                  },
                  tabs: const [
                    Tab(text: "Maintenance"),
                    Tab(text: "Project"),
                  ],
                ),
              ),
            ),
          ),
          body: Consumer<HistoryBloc>(
            builder: (context, bloc, child) {
              if (bloc.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (bloc.tabIndex == 0) {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            Functions.buildBoxShadow(),
                          ],
                        ),
                        child: ExpansionTile(
                          title: ItemTextRowView(
                            textOneColor: APP_THEME_COLOR,
                            textTwoColor: BLACK_LIGHT,
                            iconColor: APP_THEME_COLOR,
                            iconData: MdiIcons.digitalOcean,
                            textOne: "Req No",
                            textTwo: bloc.maintenanceReportList?[index]
                                    .requestMaintenanceNo
                                    ?.toString() ??
                                "",
                          ),
                          subtitle: ItemTextRowView(
                            textOneColor: APP_THEME_COLOR,
                            textTwoColor: BLACK_LIGHT,
                            iconColor: APP_THEME_COLOR,
                            iconData: Icons.calendar_month_outlined,
                            textOne: "Report Date",
                            textTwo: bloc
                                    .maintenanceReportList?[index].finishedDate
                                    ?.toString() ??
                                "",
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              child: Column(
                                children: [
                                  ItemTextRowView(
                                    textOneColor: APP_THEME_COLOR,
                                    iconColor: APP_THEME_COLOR,
                                    iconData: Icons.arrow_circle_right_outlined,
                                    textOne: "Progress",
                                    textTwo: bloc.maintenanceReportList?[index]
                                            .progress
                                            ?.toString() ??
                                        "",
                                    textTwoColor: bloc
                                                .maintenanceReportList?[index]
                                                .progress ==
                                            "100%"
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  ItemTextRowView(
                                    textOneColor: APP_THEME_COLOR,
                                    textTwoColor: BLACK_LIGHT,
                                    iconColor: APP_THEME_COLOR,
                                    iconData: Icons.arrow_circle_right_outlined,
                                    textOne: "Performance",
                                    textTwo: bloc.maintenanceReportList?[index]
                                            .performance
                                            ?.toString() ??
                                        "",
                                  ),
                                  ItemTextRowView(
                                    textOneColor: APP_THEME_COLOR,
                                    textTwoColor: BLACK_LIGHT,
                                    iconColor: APP_THEME_COLOR,
                                    iconData: Icons.arrow_circle_right_outlined,
                                    textOne: "Checked By",
                                    textTwo: bloc.maintenanceReportList?[index]
                                            .checkedBy
                                            ?.toString() ??
                                        "",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: bloc.maintenanceReportList?.length ?? 0,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                  );
                } else {
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            Functions.buildBoxShadow(),
                          ],
                        ),
                        child: ExpansionTile(
                          title: ItemTextRowView(
                            textOneColor: APP_THEME_COLOR,
                            textTwoColor: BLACK_LIGHT,
                            iconColor: APP_THEME_COLOR,
                            iconData: MdiIcons.digitalOcean,
                            textOne: "Task",
                            textTwo:
                                bloc.phaseTaskList?[index].task?.taskName ?? "",
                          ),
                          subtitle: ItemTextRowView(
                            textOneColor: APP_THEME_COLOR,
                            textTwoColor: BLACK_LIGHT,
                            iconColor: APP_THEME_COLOR,
                            iconData: Icons.calendar_month_outlined,
                            textOne: "Report Date",
                            textTwo:
                                bloc.phaseTaskList?[index].finishedDate ?? "",
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              child: Column(
                                children: [
                                  ItemTextRowView(
                                    textOneColor: APP_THEME_COLOR,
                                    textTwoColor: BLACK_LIGHT,
                                    iconColor: APP_THEME_COLOR,
                                    iconData: Icons.arrow_circle_right_outlined,
                                    textOne: "Phase",
                                    textTwo: bloc.phaseTaskList?[index].task
                                            ?.projectPhase?.phaseName ??
                                        "",
                                  ),
                                  ItemTextRowView(
                                    textOneColor: APP_THEME_COLOR,
                                    textTwoColor: BLACK_LIGHT,
                                    iconColor: APP_THEME_COLOR,
                                    iconData: Icons.arrow_circle_right_outlined,
                                    textOne: "Project",
                                    textTwo: bloc.phaseTaskList?[index].task
                                            ?.projectPhase?.project?.name ??
                                        "",
                                  ),
                                  ItemTextRowView(
                                    textOneColor: APP_THEME_COLOR,
                                    textTwoColor: BLACK_LIGHT,
                                    iconColor: APP_THEME_COLOR,
                                    iconData: Icons.arrow_circle_right_outlined,
                                    textOne: "Start Date",
                                    textTwo: bloc.phaseTaskList?[index].task
                                            ?.startDate ??
                                        "",
                                  ),
                                  ItemTextRowView(
                                    textOneColor: APP_THEME_COLOR,
                                    textTwoColor: BLACK_LIGHT,
                                    iconColor: APP_THEME_COLOR,
                                    iconData: Icons.arrow_circle_right_outlined,
                                    textOne: "Due Date",
                                    textTwo: bloc.phaseTaskList?[index].task
                                            ?.endDate ??
                                        "",
                                  ),
                                  ItemTextRowView(
                                    textOneColor: APP_THEME_COLOR,
                                    iconColor: APP_THEME_COLOR,
                                    iconData: Icons.arrow_circle_right_outlined,
                                    textOne: "Progress",
                                    textTwo:
                                        bloc.phaseTaskList?[index].progress ??
                                            "",
                                    textTwoColor: bloc
                                            .phaseTaskList![index].progress!
                                            .contains("100")
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  ItemTextRowView(
                                    textOneColor: APP_THEME_COLOR,
                                    textTwoColor: BLACK_LIGHT,
                                    iconColor: APP_THEME_COLOR,
                                    iconData: Icons.arrow_circle_right_outlined,
                                    textOne: "Performance",
                                    textTwo: bloc.phaseTaskList?[index]
                                            .performance ??
                                        "",
                                  ),
                                  ItemTextRowView(
                                    textOneColor: APP_THEME_COLOR,
                                    textTwoColor: BLACK_LIGHT,
                                    iconColor: APP_THEME_COLOR,
                                    iconData: Icons.arrow_circle_right_outlined,
                                    textOne: "Checked By",
                                    textTwo:
                                        bloc.phaseTaskList?[index].checkedBy ??
                                            "",
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: bloc.phaseTaskList?.length ?? 0,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
