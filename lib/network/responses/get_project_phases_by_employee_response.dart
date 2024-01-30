import 'package:engineering_project/data/vos/phase_vo.dart';

class GetProjectPhasesByEmployeeResponse {
  List<PhaseVO>? phases;

  GetProjectPhasesByEmployeeResponse({this.phases});

  GetProjectPhasesByEmployeeResponse.fromJson(Map<String, dynamic> json) {
    if (json['phases'] != null) {
      phases = <PhaseVO>[];
      json['phases'].forEach((v) {
        phases!.add(new PhaseVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.phases != null) {
      data['phases'] = this.phases!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
