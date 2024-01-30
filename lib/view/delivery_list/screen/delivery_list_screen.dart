import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/delivery_detail/screen/delivery_detail_screen.dart';
import 'package:engineering_project/view/delivery_list/bloc/delivery_list_bloc.dart';
import 'package:engineering_project/view/delivery_list/widgets/delivery_list_tile_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryListScreen extends StatelessWidget {
  const DeliveryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeliveryListBloc(),
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
              "Delivery List",
              style: ConfigStyle.boldStyle(18, MATERIAL_COLOR),
            ),
          ),
          body: Consumer<DeliveryListBloc>(builder: (context, bloc, child) {
            if (bloc.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemBuilder: (context, index) {
                  var deliOrder = bloc.deliList?[index];
                  return DeliveryListTileView(
                    leading: deliOrder?.doNo ?? "",
                    title: deliOrder?.deliveryDate ?? "",
                    onTapDetail: () {
                      Functions.transition(
                        context,
                        DeliveryDetailScreen(
                          deliveryOrderVO: deliOrder,
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: bloc.deliList?.length ?? 0,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
              );
            }
          })),
    );
  }
}
