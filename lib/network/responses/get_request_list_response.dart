import 'package:engineering_project/data/vos/request_data_vo.dart';

class GetRequestListResponse {
  List<RequestsVO>? requests;

  GetRequestListResponse({this.requests});

  GetRequestListResponse.fromJson(Map<String, dynamic> json) {
    if (json['requests'] != null) {
      requests = <RequestsVO>[];
      json['requests'].forEach((v) {
        requests!.add(new RequestsVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.requests != null) {
      data['requests'] = this.requests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
