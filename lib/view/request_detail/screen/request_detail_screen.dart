// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/report_request/screen/report_request_screen.dart';
import 'package:engineering_project/view/request_detail/widgets/two_text_row_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/request_detail_bloc.dart';

class RequestDetailScreen extends StatelessWidget {
  String requestNo, requestDate, condition, dueDate, roomNo, remark;
  int assetId;
  int requestId;

  RequestDetailScreen({
    Key? key,
    required this.requestNo,
    required this.requestDate,
    required this.condition,
    required this.dueDate,
    required this.roomNo,
    required this.remark,
    required this.assetId,
    required,
    required this.requestId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RequestDetailBloc(assetId),
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
            "Request Detail",
            style: ConfigStyle.boldStyle(18, MATERIAL_COLOR),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    boxShadow: [
                      Functions.buildBoxShadow(),
                    ],
                    border: Border.all(color: Colors.black26, width: 0.4),
                  ),
                  child: Column(
                    children: [
                      TwoTextRowView(
                        title: "Request No",
                        value: requestNo,
                      ),
                      const SizedBox(height: 16),
                      TwoTextRowView(
                        title: "Request Date",
                        value: requestDate,
                      ),
                      const SizedBox(height: 16),
                      TwoTextRowView(
                        title: "Condition",
                        value: condition,
                      ),
                      const SizedBox(height: 16),
                      TwoTextRowView(
                        title: "Due Date",
                        value: dueDate,
                      ),
                      const SizedBox(height: 16),
                      TwoTextRowView(
                        title: "Room",
                        value: roomNo,
                      ),
                      const SizedBox(height: 16),
                      TwoTextRowView(
                        title: "Remark",
                        value: remark,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Asset Detail",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            Functions.buildBoxShadow(),
                          ],
                        ),
                        child: Column(
                          children: [
                            Consumer<RequestDetailBloc>(
                              builder: (context, bloc, child) => TwoTextRowView(
                                  title: "Name", value: bloc.asset?.name ?? ""),
                            ),
                            const SizedBox(height: 16),
                            Consumer<RequestDetailBloc>(
                              builder: (context, bloc, child) => TwoTextRowView(
                                  title: "Code", value: bloc.asset?.code ?? ""),
                            ),
                            const SizedBox(height: 16),
                            Consumer<RequestDetailBloc>(
                              builder: (context, bloc, child) => TwoTextRowView(
                                  title: "Type", value: bloc.asset?.type ?? ""),
                            ),
                            const SizedBox(height: 16),
                            Consumer<RequestDetailBloc>(
                              builder: (context, bloc, child) => TwoTextRowView(
                                  title: "Purchase Date",
                                  value: bloc.asset?.purchaseDate ?? ""),
                            ),
                            const SizedBox(height: 16),
                            Consumer<RequestDetailBloc>(
                              builder: (context, bloc, child) => TwoTextRowView(
                                  title: "Use life",
                                  value: "${bloc.asset?.useLife}"),
                            ),
                            const SizedBox(height: 16),
                            Consumer<RequestDetailBloc>(
                              builder: (context, bloc, child) => TwoTextRowView(
                                  title: "Warranty left",
                                  value: "${bloc.asset?.warranty}"),
                            ),
                            const SizedBox(height: 16),
                            Consumer<RequestDetailBloc>(
                              builder: (context, bloc, child) => Image.network(
                                  "http://192.168.100.21:8000/api/${bloc.asset?.warrantyDocs}"),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Consumer<RequestDetailBloc>(
                        builder: (context, bloc, child) => MaterialButton(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          color: BUTTON_COLOR,
                          onPressed: () {
                            Functions.transition(
                                context,
                                ReportRequestScreen(
                                  requestId: requestId,
                                  requestNO: requestNo,
                                ));
                          },
                          child: Text(
                            "Report",
                            style: ConfigStyle.regularStyle(
                              16,
                              MATERIAL_COLOR,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
