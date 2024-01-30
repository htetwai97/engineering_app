import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:engineering_project/view/home/widgets/custom_app_bar_view.dart';
import 'package:engineering_project/view/home/widgets/drawer_property_list_view.dart';
import 'package:engineering_project/view/projects/bloc/projects_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/project_view.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: ChangeNotifierProvider(
          create: (context) => ProjectBloc(),
          child: Scaffold(
            drawer: Drawer(
              width: scaleWidth(context) / 1.4,
              child: DrawerPropertyListView(),
            ),
            appBar: PreferredSize(
              preferredSize: Size(scaleWidth(context), 60),
              child: CustomAppBarView(
                visibleDueDates: false,
                title: "Projects",
                onTap: (date) {},
                dueDateList: [],
              ),
            ),
            body: Selector<ProjectBloc, bool>(
                builder: (context, isLoading, child) {
                  if (isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            color: Colors.white,
                            child: Consumer<ProjectBloc>(
                              builder: (context, bloc, child) {
                                var phaseList = bloc.phaseList;
                                return ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: phaseList?.length ?? 0,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    var phase = phaseList?[index];
                                    return ProjectView(
                                      projectName: phase?.project?.name ?? "",
                                      contactPerson: phase
                                              ?.project?.projectContactPerson ??
                                          "",
                                      email: phase?.project?.email ?? "",
                                      phone: phase?.project?.phone.toString() ??
                                          "",
                                      phaseName: phase?.phaseName ?? "",
                                      phaseDescription:
                                          phase?.description ?? "",
                                      startDate: phase?.startDate ?? "",
                                      endDate: phase?.endDate ?? "",
                                      taskList: phase?.phaseTasks
                                              ?.where((element) =>
                                                  element.complete != 1)
                                              .toList() ??
                                          [],
                                      onTapReport: () {},
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 20,
                                    child: Center(
                                      child: Container(
                                        height: 0.5,
                                        color: Colors.black26,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
                selector: (context, bloc) => bloc.isLoading),
          ),
        ),
      ),
    );
  }
}
