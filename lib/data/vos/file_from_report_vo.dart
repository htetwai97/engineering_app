class FileFromReportVO {
  int? id;
  int? reportRequestMaintenanceId;
  String? fileType;
  List<String>? file;

  FileFromReportVO(
      {this.id, this.reportRequestMaintenanceId, this.fileType, this.file});

  FileFromReportVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reportRequestMaintenanceId = json['report_request_maintenance_id'];
    fileType = json['file_type'];
    file = json['file'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['report_request_maintenance_id'] = this.reportRequestMaintenanceId;
    data['file_type'] = this.fileType;
    data['file'] = this.file;
    return data;
  }
}
