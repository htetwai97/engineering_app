import 'package:engineering_project/data/vos/product_vo.dart';

class GetProductListResponse {
  List<ProductVO>? products;

  GetProductListResponse({this.products});

  GetProductListResponse.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductVO>[];
      json['products'].forEach((v) {
        products!.add(new ProductVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

