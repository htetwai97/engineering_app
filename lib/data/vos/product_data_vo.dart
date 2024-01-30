import 'package:engineering_project/data/vos/products.dart';

class ProductDataVO {
  int? id;
  int? fromEmployeeId;
  String? fromEmployee;
  String? requestDate;
  String? reason;
  String? requestedBy;
  List<Products>? products;

  ProductDataVO(
      {this.id,
      this.fromEmployeeId,
      this.fromEmployee,
      this.requestDate,
      this.reason,
      this.requestedBy,
      this.products});

  ProductDataVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromEmployeeId = json['from_employee_id'];
    fromEmployee = json['from_employee'];
    requestDate = json['request_date'];
    reason = json['reason'];
    requestedBy = json['requested_by'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from_employee_id'] = this.fromEmployeeId;
    data['from_employee'] = this.fromEmployee;
    data['request_date'] = this.requestDate;
    data['reason'] = this.reason;
    data['requested_by'] = this.requestedBy;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
