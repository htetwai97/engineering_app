import 'package:engineering_project/data/vos/data_from_report_vo.dart';

class GetMaintenanceReportList {
  List<DataFromReportVO>? reportList;

  GetMaintenanceReportList({
    this.reportList,
  });

  GetMaintenanceReportList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      reportList = <DataFromReportVO>[];
      json['data'].forEach((v) {
        reportList!.add(new DataFromReportVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reportList != null) {
      data['data'] = this.reportList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
