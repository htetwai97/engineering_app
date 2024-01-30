import 'package:engineering_project/data/vos/phase_task_vo.dart';
import 'package:engineering_project/data/vos/project_vo.dart';

class PhaseVO {
  int? id;
  String? phaseName;
  String? description;
  String? startDate;
  String? endDate;
  int? userId;
  int? projectId;
  ProjectVO? project;
  List<PhaseTaskVO>? phaseTasks;

  PhaseVO(
      {this.id,
      this.phaseName,
      this.description,
      this.startDate,
      this.endDate,
      this.userId,
      this.projectId,
      this.project,
      this.phaseTasks});

  PhaseVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phaseName = json['phase_name'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    userId = json['user_id'];
    projectId = json['project_id'];
    project = json['project'] != null
        ? new ProjectVO.fromJson(json['project'])
        : null;
    if (json['phasetasks'] != null) {
      phaseTasks = <PhaseTaskVO>[];
      json['phasetasks'].forEach((v) {
        phaseTasks!.add(new PhaseTaskVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phase_name'] = this.phaseName;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['user_id'] = this.userId;
    data['project_id'] = this.projectId;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    if (this.phaseTasks != null) {
      data['phasetasks'] = this.phaseTasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
