import 'package:engineering_project/data/vos/file_from_report_vo.dart';

class DataFromReportVO {
  int? id;
  int? requestMaintenanceId;
  String? requestMaintenanceNo;
  int? totalStockQty;
  String? finishedDate;
  String? progress;
  String? performance;
  int? performanceStatus;
  String? reportDescription;
  int? fileCount;
  String? checkedBy;
  List<FileFromReportVO>? files;

  DataFromReportVO(
      {this.id,
      this.requestMaintenanceId,
      this.requestMaintenanceNo,
      this.totalStockQty,
      this.finishedDate,
      this.progress,
      this.performance,
      this.performanceStatus,
      this.reportDescription,
      this.fileCount,
      this.checkedBy,
      this.files});

  DataFromReportVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requestMaintenanceId = json['request_maintenance_id'];
    requestMaintenanceNo = json['request_no'];
    totalStockQty = json['total_stock_qty'];
    finishedDate = json['finished_date'];
    progress = json['progress'];
    performance = json['performance'];
    performanceStatus = json['performance_status'];
    reportDescription = json['report_description'];
    fileCount = json['file_count'];
    checkedBy = json['checked_by'];
    if (json['files'] != null) {
      files = <FileFromReportVO>[];
      json['files'].forEach((v) {
        files!.add(new FileFromReportVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['request_maintenance_id'] = this.requestMaintenanceId;
    data['request_no'] = this.requestMaintenanceNo;
    data['total_stock_qty'] = this.totalStockQty;
    data['finished_date'] = this.finishedDate;
    data['progress'] = this.progress;
    data['performance'] = this.performance;
    data['performance_status'] = this.performanceStatus;
    data['report_description'] = this.reportDescription;
    data['file_count'] = this.fileCount;
    data['checked_by'] = this.checkedBy;
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
