class RequestMaintenanceAssetVO {
  int? id;
  String? name;
  String? code;
  int? roomId;

  RequestMaintenanceAssetVO({
    this.id,
    this.name,
    this.code,
    this.roomId,
  });

  RequestMaintenanceAssetVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    roomId = json['room_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['room_id'] = this.roomId;
    return data;
  }
}
