import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/request_maintenance/screen/request_maintenance_screen.dart';
import 'package:engineering_project/view/search_asset/bloc/search_asset_bloc.dart';
import 'package:engineering_project/view/search_asset/widgets/asset_detail_dialog_view.dart';
import 'package:engineering_project/view/search_asset/widgets/dropdown_view.dart';
import 'package:engineering_project/view/search_asset/widgets/search_asset_list_tile_view.dart';
import 'package:engineering_project/view/search_asset/widgets/title_and_dropdown_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchAssetScreen extends StatelessWidget {
  const SearchAssetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchAssetBloc(),
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
            "Search Assets",
            style: ConfigStyle.boldStyle(18, MATERIAL_COLOR),
          ),
        ),
        body: Selector<SearchAssetBloc, bool>(
            builder: (context, isLoading, child) {
              if (isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Selector<SearchAssetBloc, bool>(
                    builder: (context, isApiCalling, child) {
                      return Stack(
                        children: [
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Consumer<SearchAssetBloc>(
                                    builder: (context, bloc, child) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          DropDownSearchAssetView(
                                            hintName: bloc.selectedBuilding ??
                                                "Building",
                                            list: bloc.buildingList,
                                            onChange: (value) {
                                              bloc.onChooseBuilding(
                                                  value ?? "");
                                            },
                                          ),
                                          DropDownSearchAssetView(
                                            hintName:
                                                bloc.selectedRoom ?? "Room",
                                            list: bloc.roomList,
                                            onChange: (value) {
                                              bloc.onChooseRoom(value ?? "");
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  Consumer<SearchAssetBloc>(
                                    builder: (context, bloc, child) =>
                                        TitleAndDropDownView(
                                      focusNode: bloc.focusNode,
                                      title: "Serial No",
                                      isSerialNo: true,
                                      onChange: (serialNo) {
                                        bloc.onChangeSerialNo(serialNo ?? "");
                                      },
                                      onEditingComplete: () {
                                        bloc.onEditCompleteSearch();
                                      },
                                      onTapSearch: () {
                                        bloc.onTapSearch();
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Consumer<SearchAssetBloc>(
                                    builder: (context, bloc, child) =>
                                        ListView.separated(
                                      itemBuilder: (context, index) {
                                        return SearchAssetListTileView(
                                          code: bloc.displayAssetList?[index]
                                                  .code ??
                                              "",
                                          name: bloc.displayAssetList?[index]
                                                  .name ??
                                              "",
                                          onTapRequest: () {
                                            Functions.rightToLeftTransition(
                                              context,
                                              RequestMaintenanceScreen(
                                                selectedAsset: bloc
                                                    .displayAssetList?[index],
                                              ),
                                            );
                                          },
                                          onTapDetail: () {
                                            bloc
                                                .onTapDetail(bloc
                                                    .displayAssetList?[index])
                                                .then((value) {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AssetDetailDialogView(
                                                        asset: value);
                                                  });
                                            });
                                          },
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        height: 10,
                                      ),
                                      itemCount:
                                          bloc.displayAssetList?.length ?? 0,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                    ),
                                  ),
                                ],
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
                          ),
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
