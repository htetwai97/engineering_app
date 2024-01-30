class Products {
  int? requestMaterialListId;
  int? productId;
  String? name;
  int? quantity;

  Products({
    this.requestMaterialListId,
    this.productId,
    this.name,
    this.quantity,
  });

  Products.fromJson(Map<String, dynamic> json) {
    requestMaterialListId = json['request_material_list_id'];
    productId = json['product_id'];
    name = json['name'];
    quantity = json['requested_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_material_list_id'] = this.requestMaterialListId;
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['requested_quantity'] = this.quantity;
    return data;
  }
}
