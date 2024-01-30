import 'package:engineering_project/data/vos/site_item_vo.dart';

class SiteProductVO {
  int? id;
  String? productName;
  String? productImg;
  List<SiteItemVO>? items;

  SiteProductVO({this.id, this.productName, this.productImg, this.items});

  SiteProductVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productImg = json['product_img'];
    if (json['items'] != null) {
      items = <SiteItemVO>[];
      json['items'].forEach((v) {
        items!.add(new SiteItemVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['product_img'] = this.productImg;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
