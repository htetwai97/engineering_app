class RoomVO {
  int? id;
  String? roomNumber;
  int? buildingId;
  int? roomTypeId;
  String? createdAt;
  String? updatedAt;

  RoomVO(
      {this.id,
      this.roomNumber,
      this.buildingId,
      this.roomTypeId,
      this.createdAt,
      this.updatedAt});

  RoomVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomNumber = json['room_number'];
    buildingId = json['building_id'];
    roomTypeId = json['room_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['room_number'] = this.roomNumber;
    data['building_id'] = this.buildingId;
    data['room_type_id'] = this.roomTypeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
