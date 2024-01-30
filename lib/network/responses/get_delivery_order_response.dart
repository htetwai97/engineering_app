import 'package:engineering_project/data/vos/delivery_order_vo.dart';

class GetDeliveryOrderResponse {
  List<DeliveryOrderVO>? data;

  GetDeliveryOrderResponse({this.data});

  GetDeliveryOrderResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DeliveryOrderVO>[];
      json['data'].forEach((v) {
        data!.add(new DeliveryOrderVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
