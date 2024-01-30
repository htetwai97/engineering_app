// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:flutter/material.dart';

import 'due_date_view.dart';

class CustomAppBarView extends StatelessWidget {
  bool visibleDueDates;
  String title;
  Function(String?) onTap;
  List<String?>? dueDateList = [];
  CustomAppBarView({
    super.key,
    required this.onTap,
    this.visibleDueDates = true,
    this.title = "Assigned tasks",
    required this.dueDateList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: THEME_EXTREMITY_COLOR,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: AppBar(
              centerTitle: true,
              title: Text(
                title,
                style: ConfigStyle.boldStyle(18, MATERIAL_COLOR),
              ),
              elevation: 0,
              backgroundColor: THEME_EXTREMITY_COLOR,
              // actions: [
              //   IconButton(
              //     onPressed: () {},
              //     icon: const Icon(Icons.person),
              //   ),
              // ],
            ),
          ),
          Visibility(
            visible: visibleDueDates,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: THEME_EXTREMITY_COLOR,
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: dueDateList?.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return DueDateView(
                      dueDate: dueDateList?[index],
                      onTap: () {
                        onTap(dueDateList?[index]);
                      },
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
