import 'package:engineering_project/data/vos/request_maintenance_asset_vo.dart';

class RequestMaintenanceRoomVO {
  int? id;
  String? roomNumber;
  int? buildingId;
  int? roomTypeId;
  String? createdAt;
  String? updatedAt;
  List<RequestMaintenanceAssetVO>? assetRequest;

  RequestMaintenanceRoomVO(
      {this.id,
        this.roomNumber,
        this.buildingId,
        this.roomTypeId,
        this.createdAt,
        this.updatedAt,
        this.assetRequest});

  RequestMaintenanceRoomVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomNumber = json['room_number'];
    buildingId = json['building_id'];
    roomTypeId = json['room_type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['assetrequest'] != null) {
      assetRequest = <RequestMaintenanceAssetVO>[];
      json['assetrequest'].forEach((v) {
        assetRequest!.add(new RequestMaintenanceAssetVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['room_number'] = this.roomNumber;
    data['building_id'] = this.buildingId;
    data['room_type_id'] = this.roomTypeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.assetRequest != null) {
      data['assetrequest'] = this.assetRequest!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}