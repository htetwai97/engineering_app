class RequestMaintenanceBuildingVO {
  int? id;
  String? name;
  int? numberPerFloor;
  String? createdAt;
  String? updatedAt;

  RequestMaintenanceBuildingVO(
      {this.id,
      this.name,
      this.numberPerFloor,
      this.createdAt,
      this.updatedAt});

  RequestMaintenanceBuildingVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    numberPerFloor = json['number_per_floor'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number_per_floor'] = this.numberPerFloor;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
