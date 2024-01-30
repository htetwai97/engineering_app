// // ignore_for_file: must_be_immutable
//
// import 'package:engineering_project/core/core_config/config_color.dart';
// import 'package:engineering_project/core/core_config/config_style.dart';
// import 'package:engineering_project/core/core_function/functions.dart';
// import 'package:flutter/material.dart';
// import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
//
// import '../../../data/vos/phase_task_vo.dart';
// import '../bloc/history_bloc.dart';
//
// class ProjectHistoryView extends StatelessWidget {
//   String projectName, phaseName;
//   List<PhaseTaskVO> taskList;
//   final HistoryBloc historyBloc;
//
//   ProjectHistoryView(
//       {super.key,
//       required this.projectName,
//       required this.phaseName,
//       required this.taskList,
//       required this.historyBloc});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: APP_THEME_COLOR_REDUCE,
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(color: Colors.black12, width: 1),
//         boxShadow: [
//           Functions.buildBoxShadow(),
//         ],
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//             decoration: BoxDecoration(
//               color: MATERIAL_COLOR,
//               borderRadius: BorderRadius.circular(15),
//               border: Border.all(color: Colors.black12, width: 1),
//               boxShadow: [
//                 Functions.buildBoxShadow(),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   projectName,
//                   style: ConfigStyle.regularStyle(18, BLACK_HEAVY),
//                 ),
//                 Text(
//                   phaseName,
//                   style: ConfigStyle.regularStyle(18, BLACK_HEAVY),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),
//           Visibility(
//             visible: taskList.isNotEmpty,
//             child: GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: taskList.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 mainAxisSpacing: 5,
//                 crossAxisSpacing: 5,
//                 crossAxisCount: 2,
//                 childAspectRatio: 4.0 /
//                     1.0, // width : height = 4 -> width/height = 4 -> width = 4height
//               ),
//               itemBuilder: (context, index) {
//                 var task = taskList[index];
//                 var progress = task.progress ?? "0%";
//
//                 return Visibility(
//                   visible: historyBloc.isProgressLargerThanZero(progress),
//                   child: FutureBuilder(
//                     future: Future.wait([
//                       Future.value(
//                           historyBloc.progressColor(progress: progress)),
//                       Future.value(
//                           historyBloc.getProgressValueBetween0And1(progress)),
//                     ]),
//                     builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return CircularProgressIndicator(); // Show a loading indicator if data is being fetched
//                       }
//
//                       Color progressColor = snapshot.data![0] as Color;
//                       var progressValue = snapshot.data![1] as double;
//
//                       return LiquidLinearProgressIndicator(
//                         value: progressValue,
//                         valueColor: AlwaysStoppedAnimation(progressColor),
//                         backgroundColor: Colors.white,
//                         borderColor: progressColor,
//                         borderWidth: 0.5,
//                         borderRadius: 12.0,
//                         direction: Axis.horizontal,
//                         center: Text("${task.taskName} (${task.progress})"),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
