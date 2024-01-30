class DeliveryItemVO {
  int? id;
  int? deliveryOrderId;
  int? productId;
  String? productName;
  int? itemId;
  String? itemModel;
  int? issueQty;
  int? rejectQty;
  int? rejectStatus;

  DeliveryItemVO(
      {this.id,
      this.deliveryOrderId,
      this.productId,
      this.productName,
      this.itemId,
      this.itemModel,
      this.issueQty,
      this.rejectQty,
      this.rejectStatus});

  DeliveryItemVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deliveryOrderId = json['delivery_order_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    itemId = json['item_id'];
    itemModel = json['item_model'];
    issueQty = json['issue_qty'];
    rejectQty = json['reject_qty'];
    rejectStatus = json['reject_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['delivery_order_id'] = this.deliveryOrderId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['item_id'] = this.itemId;
    data['item_model'] = this.itemModel;
    data['issue_qty'] = this.issueQty;
    data['reject_qty'] = this.rejectQty;
    data['reject_status'] = this.rejectStatus;
    return data;
  }
}
