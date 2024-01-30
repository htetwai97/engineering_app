import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/search_asset/widgets/dropdown_view.dart';
import 'package:engineering_project/view/site_inventory/bloc/site_inventory_bloc.dart';
import 'package:engineering_project/view/site_inventory/widgets/product_list_tile_for_site_view.dart';
import 'package:engineering_project/view/site_item_list/screen/site_item_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SiteInventoryScreen extends StatelessWidget {
  const SiteInventoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SiteInventoryBloc(),
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
            "Site Inventory",
            style: ConfigStyle.boldStyle(18, MATERIAL_COLOR),
          ),
        ),
        body: Selector<SiteInventoryBloc, bool>(
          builder: (context, isLoading, child) {
            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Consumer<SiteInventoryBloc>(
                      builder: (context, bloc, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DropDownSearchAssetView(
                            hintName: bloc.selectedProjectName ?? "Projects",
                            list: bloc.projectNameList,
                            onChange: (value) {
                              bloc.onChooseProject(value ?? "");
                            },
                          ),
                          DropDownSearchAssetView(
                            hintName: bloc.selectedPhaseName ?? "Phase",
                            list: bloc.phaseNameList,
                            onChange: (value) {
                              bloc.onChoosePhase(value ?? "");
                            },
                          ),
                        ],
                      ),
                    ),
                    Consumer<SiteInventoryBloc>(
                      builder: (context, bloc, child) {
                        var siteProductList = bloc.siteProductList ?? [];
                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          itemBuilder: (context, index) {
                            var siteProduct = siteProductList[index];
                            return ProductListTileForSiteView(
                              url: siteProduct?.productImg,
                              title: siteProduct?.productName,
                              quantity: siteProduct?.items?.length ?? 0,
                              onTapDetail: () {
                                Functions.rightToLeftTransition(
                                  context,
                                  SiteItemListScreen(siteProduct: siteProduct),
                                );
                              },
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemCount: siteProductList.length,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        );
                      },
                    ),
                  ],
                ),
              );
            }
          },
          selector: (context, bloc) => bloc.isLoading,
        ),
      ),
    );
  }
}
