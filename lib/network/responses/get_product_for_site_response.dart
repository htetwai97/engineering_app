import 'package:engineering_project/data/vos/site_product_vo.dart';

class GetProductForSiteInventoryResponse {
  List<SiteProductVO>? data;

  GetProductForSiteInventoryResponse({this.data});

  GetProductForSiteInventoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SiteProductVO>[];
      json['data'].forEach((v) {
        data!.add(new SiteProductVO.fromJson(v));
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



