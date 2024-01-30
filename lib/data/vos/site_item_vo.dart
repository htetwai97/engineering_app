class SiteItemVO {
  int? id;
  String? zone;
  String? shelf;
  String? level;
  String? serialNo;
  String? model;
  String? size;
  String? color;
  String? dimension;
  String? hsCode;
  String? otherSpecification;
  int? conditionType;
  String? conditionRemark;
  String? damageRemark;
  int? stockQty;

  SiteItemVO(
      {this.id,
      this.zone,
      this.shelf,
      this.level,
      this.serialNo,
      this.model,
      this.size,
      this.color,
      this.dimension,
      this.hsCode,
      this.otherSpecification,
      this.conditionType,
      this.conditionRemark,
      this.damageRemark,
      this.stockQty});

  SiteItemVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    zone = json['zone'];
    shelf = json['shelf'];
    level = json['level'];
    serialNo = json['serial_no'];
    model = json['model'];
    size = json['size'];
    color = json['color'];
    dimension = json['dimension'];
    hsCode = json['hs_code'];
    otherSpecification = json['other_specification'];
    conditionType = json['condition_type'];
    conditionRemark = json['condition_remark'];
    damageRemark = json['damage_remark'];
    stockQty = json['stock_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['zone'] = this.zone;
    data['shelf'] = this.shelf;
    data['level'] = this.level;
    data['serial_no'] = this.serialNo;
    data['model'] = this.model;
    data['size'] = this.size;
    data['color'] = this.color;
    data['dimension'] = this.dimension;
    data['hs_code'] = this.hsCode;
    data['other_specification'] = this.otherSpecification;
    data['condition_type'] = this.conditionType;
    data['condition_remark'] = this.conditionRemark;
    data['damage_remark'] = this.damageRemark;
    data['stock_qty'] = this.stockQty;
    return data;
  }
}
