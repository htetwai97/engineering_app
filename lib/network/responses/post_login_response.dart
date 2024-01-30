import '../../data/vos/employee_vo.dart';

class PostLoginResponse {
  String? message;
  int? status;
  String? accessToken;
  EmployeeVO? employee;

  PostLoginResponse(
      {this.message, this.status, this.accessToken, this.employee});

  PostLoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    accessToken = json['access_token'];
    employee = json['employee'] != null
        ? new EmployeeVO.fromJson(json['employee'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['access_token'] = this.accessToken;
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    return data;
  }
}
