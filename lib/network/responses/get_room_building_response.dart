import 'package:engineering_project/data/vos/request_maintenance_building_vo.dart';
import 'package:engineering_project/data/vos/request_maintenance_room_vo.dart';

class GetRoomBuildingResponse {
  List<RequestMaintenanceRoomVO>? room;
  List<RequestMaintenanceBuildingVO>? buildings;

  GetRoomBuildingResponse({this.room, this.buildings});

  GetRoomBuildingResponse.fromJson(Map<String, dynamic> json) {
    if (json['room'] != null) {
      room = <RequestMaintenanceRoomVO>[];
      json['room'].forEach((v) {
        room!.add(new RequestMaintenanceRoomVO.fromJson(v));
      });
    }
    if (json['buildings'] != null) {
      buildings = <RequestMaintenanceBuildingVO>[];
      json['buildings'].forEach((v) {
        buildings!.add(new RequestMaintenanceBuildingVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.room != null) {
      data['room'] = this.room!.map((v) => v.toJson()).toList();
    }
    if (this.buildings != null) {
      data['buildings'] = this.buildings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
