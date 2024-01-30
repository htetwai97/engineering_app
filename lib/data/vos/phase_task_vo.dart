class PhaseTaskVO {
  int? id;
  String? taskName;
  String? description;
  String? startDate;
  String? endDate;
  int? projectPhaseId;
  int? status;
  String? progress;
  int? complete;

  PhaseTaskVO({
    this.id,
    this.taskName,
    this.description,
    this.startDate,
    this.endDate,
    this.projectPhaseId,
    this.status,
    this.progress,
    this.complete,
  });

  PhaseTaskVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskName = json['task_name'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    projectPhaseId = json['project_phase_id'];
    status = json['status'];
    progress = json['progress'];
    complete = json['complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['task_name'] = this.taskName;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['project_phase_id'] = this.projectPhaseId;
    data['status'] = this.status;
    data['complete'] = this.complete;
    data['progress'] = this.progress;
    return data;
  }
}
