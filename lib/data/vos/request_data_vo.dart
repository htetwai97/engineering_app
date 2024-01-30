import 'package:engineering_project/data/vos/asset_data_vo.dart';
import 'package:engineering_project/data/vos/employee_vo.dart';

class RequestsVO {
  int? id;
  String? requestNo;
  String? requestDate;
  String? condition;
  String? requirementRemark;
  String? dueDate;
  int? assetId;
  int? employeeId;
  int? finishStatus;
  String? progress;
  String? createdAt;
  String? updatedAt;
  AssetDataVO? asset;
  EmployeeVO? employee;

  RequestsVO(
      {this.id,
      this.requestNo,
      this.requestDate,
      this.condition,
      this.requirementRemark,
      this.dueDate,
      this.assetId,
      this.employeeId,
      this.finishStatus,
      this.progress,
      this.createdAt,
      this.updatedAt,
      this.asset,
      this.employee});

  RequestsVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requestNo = json['request_no'];
    requestDate = json['requset_date'];
    condition = json['condition'];
    requirementRemark = json['requirement_remark'];
    dueDate = json['due_date'];
    assetId = json['asset_id'];
    employeeId = json['employee_id'];
    finishStatus = json['finish_status'];
    progress = json['progress'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    asset =
        json['asset'] != null ? new AssetDataVO.fromJson(json['asset']) : null;
    employee = json['employee'] != null
        ? new EmployeeVO.fromJson(json['employee'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['request_no'] = this.requestNo;
    data['requset_date'] = this.requestDate;
    data['condition'] = this.condition;
    data['requirement_remark'] = this.requirementRemark;
    data['due_date'] = this.dueDate;
    data['asset_id'] = this.assetId;
    data['employee_id'] = this.employeeId;
    data['finish_status'] = this.finishStatus;
    data['progress'] = this.progress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.asset != null) {
      data['asset'] = this.asset!.toJson();
    }
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    return data;
  }
}
