import 'dart:io';

class ReportVO {
  int? request_id;
  int? phase_task_id;
  String? report_description;
  String? finished_date;
  String? checked_by;
  int? complete;
  int? progress;
  int? task_status;
  List<String>? base64PhotoList;
  List<String>? base64VideoList;
  List<File>? fileList;

  ReportVO({
    this.request_id,
    this.phase_task_id,
    this.report_description,
    this.finished_date,
    this.checked_by,
    this.complete,
    this.progress,
    this.task_status,
    this.base64PhotoList,
    this.base64VideoList,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_id'] = this.request_id;
    data['phase_task_id'] = this.phase_task_id;
    data['report_description'] = this.report_description;
    data['finished_date'] = this.finished_date;
    data['checked_by'] = this.checked_by;
    data['progress'] = this.progress;
    data['task_status'] = this.task_status;
    data['photo'] = this.base64PhotoList;
    data['video'] = this.base64VideoList;
    return data;
  }
}
