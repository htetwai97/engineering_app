class RequestMaintenanceFormVO {
  String? requestNo;
  String? requestDate;
  String? dueDate;
  int? assetId;
  String? condition;
  String? requirementRemark;

  RequestMaintenanceFormVO({
    this.requestNo,
    this.requestDate,
    this.dueDate,
    this.assetId,
    this.condition,
    this.requirementRemark,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_no'] = this.requestNo;
    data['requset_date'] = this.requestDate;
    data['due_date'] = this.dueDate;
    data['asset_id'] = this.assetId;
    data['condition'] = this.condition;
    data['requirement_remark'] = this.requirementRemark;
    return data;
  }
}
