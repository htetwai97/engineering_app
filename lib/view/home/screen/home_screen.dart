import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/home/widgets/custom_app_bar_view.dart';
import 'package:engineering_project/view/home/widgets/drawer_property_list_view.dart';
import 'package:engineering_project/view/home/widgets/request_item_detail_view.dart';
import 'package:engineering_project/view/request_detail/screen/request_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/request_list_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RequestListBloc(),
      child: Container(
        color: Colors.black,
        child: SafeArea(
          child: Scaffold(
            drawer: Drawer(
              width: scaleWidth(context) / 1.4,
              child: DrawerPropertyListView(),
            ),
            appBar: PreferredSize(
              preferredSize: Size(scaleWidth(context), 160),
              child: Consumer<RequestListBloc>(
                builder: (context, bloc, child) => CustomAppBarView(
                    dueDateList: bloc.dueDateList,
                    onTap: (date) {
                      bloc.onTapDate(date ?? "");
                    }),
              ),
            ),
            body: Selector<RequestListBloc, bool>(
                selector: (context, bloc) => bloc.isLoading,
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
                          Container(
                            color: Colors.white,
                            child: Consumer<RequestListBloc>(
                              builder: (context, bloc, child) =>
                                  ListView.separated(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                shrinkWrap: true,
                                itemCount: bloc.requestDataList?.length ?? 0,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) =>
                                    RequestItemDetailView(
                                  requestNo:
                                      bloc.requestDataList?[index].requestNo ??
                                          "",
                                  condition:
                                      bloc.requestDataList?[index].condition ??
                                          "",
                                  assetName: bloc.requestDataList?[index].asset
                                          ?.name ??
                                      "",
                                  dueDate:
                                      bloc.requestDataList?[index].dueDate ??
                                          "",
                                  onTapDetail: () {
                                    Functions.bottomTopUp(
                                      context,
                                      RequestDetailScreen(
                                          requestId:
                                              bloc.requestDataList?[index].id ??
                                                  0,
                                          requestNo: bloc
                                                  .requestDataList?[index]
                                                  .requestNo ??
                                              "",
                                          requestDate: bloc
                                                  .requestDataList?[index]
                                                  .requestDate ??
                                              "",
                                          condition: bloc
                                                  .requestDataList?[index]
                                                  .condition ??
                                              "",
                                          dueDate:
                                              bloc.requestDataList?[index].dueDate ??
                                                  "",
                                          roomNo: bloc.requestDataList?[index]
                                                  .asset?.room?.roomNumber ??
                                              "",
                                          remark: bloc.requestDataList?[index]
                                                  .requirementRemark ??
                                              "",
                                          assetId: bloc.requestDataList?[index].assetId ?? 0),
                                    );
                                  },
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}
