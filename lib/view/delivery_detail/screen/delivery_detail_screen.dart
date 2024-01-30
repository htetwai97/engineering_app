import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/data/vos/delivery_order_vo.dart';
import 'package:engineering_project/view/delivery_detail/bloc/delivery_detail_bloc.dart';
import 'package:engineering_project/view/delivery_detail/widgets/delivery_general_info_view.dart';
import 'package:engineering_project/view/menu/screen/menu_screen.dart';
import 'package:engineering_project/view/projects/widgets/project_view.dart';
import 'package:engineering_project/view/site_item_list/widgets/item_for_site_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class DeliveryDetailScreen extends StatelessWidget {
  final DeliveryOrderVO? deliveryOrderVO;
  const DeliveryDetailScreen({
    Key? key,
    required this.deliveryOrderVO,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeliveryDetailBloc(),
      child: Scaffold(
        floatingActionButton: Consumer<DeliveryDetailBloc>(
          builder: (context, bloc, child) => FloatingActionButton(
            backgroundColor: (deliveryOrderVO?.receiveStatus == 0)
                ? Colors.blue
                : Colors.grey,
            onPressed: () {
              if (deliveryOrderVO?.receiveStatus == 0) {
                bloc.onTapReceive(deliveryOrderVO?.id ?? 0).then((value) {
                  Functions.replacementTransition(context, const MenuScreen());
                });
              } else {
                Functions.toast(
                    msg: "Order is already received", status: false);
              }
            },
            child: Center(
              child: Text(
                "Receive",
                style: ConfigStyle.regularStyle(
                  10,
                  WHITE_COLOR,
                ),
              ),
            ),
          ),
        ),
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
            "Delivery Detail",
            style: ConfigStyle.boldStyle(18, MATERIAL_COLOR),
          ),
        ),
        body: Selector<DeliveryDetailBloc, bool>(
          builder: (context, isLoading, child) {
            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    DeliveryGeneralInfoView(
                      deliNo: deliveryOrderVO?.doNo ?? "",
                      deliDate: deliveryOrderVO?.deliveryDate ?? "",
                      project: deliveryOrderVO?.project ?? "",
                      phase: deliveryOrderVO?.projectPhase ?? "",
                    ),
                    ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: MATERIAL_COLOR,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black12, width: 1),
                            boxShadow: [
                              Functions.buildBoxShadow(),
                            ],
                          ),
                          child: ExpansionTile(
                            title: Text(
                              "No. $index",
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Column(
                              children: [
                                const SizedBox(height: 10),
                                ProjectOwnerInfoView(
                                  title: deliveryOrderVO
                                          ?.deliveryOrderList?[index]
                                          .productName ??
                                      "",
                                  iconData: MdiIcons.materialDesign,
                                ),
                                ProjectOwnerInfoView(
                                  title: deliveryOrderVO
                                          ?.deliveryOrderList?[index].issueQty
                                          ?.toString() ??
                                      "",
                                  iconData: MdiIcons.counter,
                                ),
                              ],
                            ),
                            children: [
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ItemForSiteDetailView(
                                  visibleExtraData: false,
                                  model: deliveryOrderVO
                                          ?.deliveryOrderList?[index]
                                          .itemModel ??
                                      "",
                                  serialNo: "",
                                  size: "",
                                  color: "",
                                  dimension: "",
                                  specification: "",
                                  condition: "",
                                  zone: "",
                                  shelf: "",
                                  level: "",
                                ),
                              ),
                              const SizedBox(height: 10),
                              // MaterialButton(
                              //   onPressed: () {
                              //
                              //   },
                              //   padding: const EdgeInsets.symmetric(
                              //       horizontal: 20, vertical: 10),
                              //   color: Colors.green,
                              //   child: Text(
                              //     "Receive",
                              //     style: ConfigStyle.regularStyle(
                              //       14,
                              //       MATERIAL_COLOR,
                              //     ),
                              //   ),
                              // ),
                              // const SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount:
                          deliveryOrderVO?.deliveryOrderList?.length ?? 0,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                    )
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
