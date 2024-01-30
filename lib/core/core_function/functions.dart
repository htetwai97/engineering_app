import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Functions {
  static void transition(context, Widget screen, [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.push(context,
          PageTransition(child: screen, type: PageTransitionType.fade));
    });
  }

  static void bottomTopUp(context, Widget screen, [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.push(context,
          PageTransition(child: screen, type: PageTransitionType.bottomToTop));
    });
  }

  static void rightToLeftTransition(context, Widget screen,
      [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.push(context,
          PageTransition(child: screen, type: PageTransitionType.rightToLeft));
    });
  }

  static void replace(context, Widget screen, [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      Navigator.removeRoute(context,
          PageTransition(child: screen, type: PageTransitionType.fade));
    });
  }

  static void replacementTransition(context, Widget screen,
      [Duration? duration]) {
    Future.delayed(duration ?? const Duration(milliseconds: 0), () async {
      await Navigator.pushReplacement(
        context,
        PageTransition(child: screen, type: PageTransitionType.fade),
      );
    });
  }

  static toast({String? msg, bool status = true}) {
    return Fluttertoast.showToast(
        msg: msg.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: status ? BLACK_LIGHT : Colors.red,
        textColor: WHITE_COLOR,
        fontSize: 16.0);
  }

  static buildBoxShadow() {
    return const BoxShadow(
      color: Colors.black12,
      offset: Offset(0, 0),
      spreadRadius: 0.3,
      blurRadius: 10,
      blurStyle: BlurStyle.outer,
    );
  }

// showDialog(
//     context: context,
//     builder: (context) {
//       return Card(
//         color: Colors.transparent,
//         child: Center(
//           child: Container(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: 10, vertical: 20),
//             width: scaleWidth(context) / 1.2,
//             height: scaleHeight(context) / 3.5,
//             decoration: BoxDecoration(
//               color: WHITE_COLOR,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 Functions.buildBoxShadow(),
//               ],
//             ),
//             child: Column(
//               mainAxisAlignment:
//                   MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment:
//                   CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Received by",
//                   style: ConfigStyle.regularStyle(
//                     14,
//                     BLACK_HEAVY,
//                   ),
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: "Enter receiver name",
//                     isDense: true,
//                     contentPadding:
//                         EdgeInsets.symmetric(
//                       vertical:
//                           scaleWidth(context) / 80,
//                       horizontal:
//                           scaleWidth(context) / 10,
//                     ),
//                     border:
//                         const OutlineInputBorder(),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 40),
//                   child: MaterialButton(
//                     color: LOGIN_BUTTON_COLOR,
//                     onPressed: () {},
//                     padding:
//                         const EdgeInsets.symmetric(
//                             vertical: 10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius:
//                           BorderRadius.circular(14),
//                     ),
//                     child: SizedBox(
//                       width: scaleWidth(context),
//                       child: Center(
//                         child: Text(
//                           "Submit",
//                           style:
//                               ConfigStyle.boldStyle(
//                             16,
//                             MATERIAL_COLOR,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
}
