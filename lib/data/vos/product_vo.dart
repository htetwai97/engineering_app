import 'package:engineering_project/persistence/hive/constant/hive_constants.dart';
import 'package:hive/hive.dart';
part 'product_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_PRODUCT_VO, adapterName: "ProductVOAdapter")
class ProductVO {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? productName;
  @HiveField(2)
  String? productImg;
  @HiveField(3)
  int? quantity;

  ProductVO({
    this.id,
    this.productName,
    this.productImg,
    this.quantity,
  });

  ProductVO.fromJson(Map<String, dynamic> json) {
    id = json['product_id'];
    productName = json['product_name'];
    productImg = json['product_img'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.id;
    data['product_name'] = this.productName;
    data['product_img'] = this.productImg;
    data['quantity'] = this.quantity;
    return data;
  }
}
