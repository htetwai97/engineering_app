import 'package:engineering_project/data/vos/product_data_vo.dart';

class GetProductDataResponse {
  List<ProductDataVO>? data;

  GetProductDataResponse({this.data});

  GetProductDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProductDataVO>[];
      json['data'].forEach((v) {
        data!.add(ProductDataVO.fromJson(v));
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
