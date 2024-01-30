import '../../data/vos/report_vo.dart';

class PostReportTaskResponseVO {
  ReportVO? data;

  PostReportTaskResponseVO({this.data});

  PostReportTaskResponseVO.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['phase'] = this.data!.toJson();
    }
    return data;
  }
}
