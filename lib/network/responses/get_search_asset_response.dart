import 'package:engineering_project/data/vos/request_maintenance_asset_vo.dart';

class GetSearchAssetResponse {
  List<RequestMaintenanceAssetVO>? data;

  GetSearchAssetResponse({this.data});

  GetSearchAssetResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RequestMaintenanceAssetVO>[];
      json['data'].forEach((v) {
        data!.add(new RequestMaintenanceAssetVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
