// ignore_for_file: must_be_immutable

import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:engineering_project/data/vos/request_maintenance_asset_vo.dart';
import 'package:engineering_project/view/login/widgets/common_text_field_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core_config/config_color.dart';
import '../../../core/core_config/config_style.dart';
import '../../home/widgets/drawer_property_list_view.dart';
import '../bloc/request_maintenance_bloc.dart';
import '../widgets/btn_view.dart';
import '../widgets/common_app_bar_view.dart';
import '../widgets/date_view.dart';
import '../widgets/drop_down.dart';

class RequestMaintenanceScreen extends StatelessWidget {
  RequestMaintenanceAssetVO? selectedAsset;
  RequestMaintenanceScreen({
    Key? key,
    this.selectedAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RequestMaintenanceBloc(selectedAsset: selectedAsset),
      child: Scaffold(
        floatingActionButton: Consumer<RequestMaintenanceBloc>(
          builder: (context, bloc, child) => BtnView(
              btnName: "Submit",
              onTouch: () {
                bloc.onTapRequest().then((value) => Navigator.pop(context));
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        drawer: Drawer(
          width: scaleWidth(context) / 1.4,
          child: DrawerPropertyListView(),
        ),
        appBar: PreferredSize(
          preferredSize: Size(scaleWidth(context), 50),
          child: CommonAppBarView(
            isEnableBack: true,
            onTapBack: () {
              Navigator.pop(context);
              //Functions.replacementTransition(context, HomeScreen());
            },
            title: "Request Maintenance",
          ),
        ),
        body: Selector<RequestMaintenanceBloc, bool>(
            builder: (context, isLoading, child) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: scaleWidth(context) / 10,
                          vertical: scaleHeight(context) / 20),
                      child: Column(
                        children: [
                          // title
                          Center(
                            child: Text(
                              "Request Maintenance Form",
                              style: ConfigStyle.boldStyle(
                                20,
                                BLACK_HEAVY,
                              ),
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 25),
                          //request no tf
                          Consumer<RequestMaintenanceBloc>(
                            builder: (context, bloc, child) =>
                                CommonTextFieldView(
                              focusNode: bloc.fNodeRequestNo,
                              renewController: (controller) {},
                              isBorderIncluded: true,
                              labelText: "Request No.",
                              onChanged: (value) {
                                bloc.onChangeRequestNo(value);
                              },
                              onEditingComplete: () {
                                bloc.onEditingCompleteRequestNo();
                              },
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 30),
                          //request date due date in a row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Consumer<RequestMaintenanceBloc>(
                                builder: (context, bloc, child) => DateView(
                                    dateName:
                                        bloc.requestDate ?? "request date",
                                    onTapDateIcon: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate:
                                            bloc.date ?? DateTime.now(),
                                        firstDate: DateTime(2021, 3),
                                        lastDate: DateTime(2101),
                                      );
                                      bloc.onRequestDatePick(picked!);
                                    }),
                              ),
                              Consumer<RequestMaintenanceBloc>(
                                builder: (context, bloc, child) => DateView(
                                    dateName: bloc.dueDate ?? "due date",
                                    onTapDateIcon: () async {
                                      final DateTime? picked =
                                          await showDatePicker(
                                        context: context,
                                        initialDate:
                                            bloc.date ?? DateTime.now(),
                                        firstDate: DateTime(2021, 3),
                                        lastDate: DateTime(2101),
                                      );
                                      bloc.onDueDatePick(picked!);
                                    }),
                              ),
                            ],
                          ),
                          SizedBox(height: scaleHeight(context) / 40),
                          //building, choose building/dd
                          Consumer<RequestMaintenanceBloc>(
                            builder: (context, bloc, child) => Visibility(
                              visible: bloc.selectedAsset == null,
                              child: Column(
                                children: [
                                  DropDownView(
                                    list: bloc.buildingList,
                                    menuTitle: "Choose Building",
                                    onChange: (value) {
                                      bloc.onChooseBuilding(value ?? "");
                                    },
                                  ),
                                  SizedBox(height: scaleHeight(context) / 40),
                                ],
                              ),
                            ),
                          ),
                          Consumer<RequestMaintenanceBloc>(
                            builder: (context, bloc, child) => Visibility(
                              visible: bloc.selectedAsset == null,
                              child: Column(
                                children: [
                                  DropDownView(
                                    list: bloc.roomList,
                                    menuTitle: "Choose Room",
                                    onChange: (value) {
                                      bloc.onChooseRoom(value ?? "");
                                    },
                                  ),
                                  SizedBox(height: scaleHeight(context) / 40),
                                ],
                              ),
                            ),
                          ),
                          Consumer<RequestMaintenanceBloc>(
                            builder: (context, bloc, child) => Visibility(
                              visible: bloc.selectedAsset == null,
                              child: Column(
                                children: [
                                  DropDownView(
                                    list: bloc.assetList,
                                    menuTitle: "Choose Asset",
                                    onChange: (value) {
                                      bloc.onChooseAsset(value ?? "");
                                    },
                                  ),
                                  SizedBox(height: scaleHeight(context) / 40),
                                ],
                              ),
                            ),
                          ),
                          Consumer<RequestMaintenanceBloc>(
                            builder: (context, bloc, child) => Visibility(
                              visible: bloc.selectedAsset != null,
                              child: Column(
                                children: [
                                  DropDownView(
                                    selectedValue: bloc.selectedAsset?.name,
                                    list: bloc.assetList,
                                    menuTitle: "Choose Asset",
                                    onChange: (value) {},
                                  ),
                                  SizedBox(height: scaleHeight(context) / 40),
                                ],
                              ),
                            ),
                          ),
                          Consumer<RequestMaintenanceBloc>(
                            builder: (context, bloc, child) =>
                                CommonTextFieldView(
                              focusNode: bloc.fNodeCondition,
                              renewController: (controller) {},
                              isBorderIncluded: true,
                              labelText: "Condition",
                              onChanged: (value) {
                                bloc.onChangeCondition(value);
                              },
                              onEditingComplete: () {
                                bloc.onEditingCompleteCondition();
                              },
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 40),
                          //requirement remark tf
                          Consumer<RequestMaintenanceBloc>(
                            builder: (context, bloc, child) =>
                                CommonTextFieldView(
                              focusNode: bloc.fNodeReqRemark,
                              renewController: (controller) {},
                              isBorderIncluded: true,
                              labelText: "Requirement Remark",
                              onChanged: (value) {
                                bloc.onChangeReqRemark(value);
                              },
                              onEditingComplete: () {
                                bloc.onEditingCompleteReqRemark();
                              },
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 30),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isLoading,
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
            selector: (context, bloc) => bloc.isLoading),
      ),
    );
  }
}
