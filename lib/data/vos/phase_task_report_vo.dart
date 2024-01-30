class PhaseTaskReportVO {
  int? id;
  int? totalStockQty;
  int? phaseTaskId;
  String? finishedDate;
  String? progress;
  String? performance;
  int? performanceStatus;
  String? reportDescription;
  int? fileCount;
  String? checkedBy;
  int? taskStatus;
  String? createdAt;
  String? updatedAt;
  List<FileFromTaskReportVO>? files;
  TaskFromPhaseTaskReportVO? task;

  PhaseTaskReportVO(
      {this.id,
      this.totalStockQty,
      this.phaseTaskId,
      this.finishedDate,
      this.progress,
      this.performance,
      this.performanceStatus,
      this.reportDescription,
      this.fileCount,
      this.checkedBy,
      this.taskStatus,
      this.createdAt,
      this.updatedAt,
      this.files,
      this.task});

  PhaseTaskReportVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalStockQty = json['total_stock_qty'];
    phaseTaskId = json['phase_task_id'];
    finishedDate = json['finished_date'];
    progress = json['progress'];
    performance = json['performance'];
    performanceStatus = json['performance_status'];
    reportDescription = json['report_description'];
    fileCount = json['file_count'];
    checkedBy = json['checked_by'];
    taskStatus = json['task_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['files'] != null) {
      files = <FileFromTaskReportVO>[];
      json['files'].forEach((v) {
        files!.add(new FileFromTaskReportVO.fromJson(v));
      });
    }
    task = json['task'] != null
        ? new TaskFromPhaseTaskReportVO.fromJson(json['task'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total_stock_qty'] = this.totalStockQty;
    data['phase_task_id'] = this.phaseTaskId;
    data['finished_date'] = this.finishedDate;
    data['progress'] = this.progress;
    data['performance'] = this.performance;
    data['performance_status'] = this.performanceStatus;
    data['report_description'] = this.reportDescription;
    data['file_count'] = this.fileCount;
    data['checked_by'] = this.checkedBy;
    data['task_status'] = this.taskStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.files != null) {
      data['files'] = this.files!.map((v) => v.toJson()).toList();
    }
    if (this.task != null) {
      data['task'] = this.task!.toJson();
    }
    return data;
  }
}

class FileFromTaskReportVO {
  int? id;
  int? reportTaskId;
  String? fileType;
  String? file;
  String? createdAt;
  String? updatedAt;

  FileFromTaskReportVO(
      {this.id,
      this.reportTaskId,
      this.fileType,
      this.file,
      this.createdAt,
      this.updatedAt});

  FileFromTaskReportVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reportTaskId = json['report_task_id'];
    fileType = json['file_type'];
    file = json['file'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['report_task_id'] = this.reportTaskId;
    data['file_type'] = this.fileType;
    data['file'] = this.file;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TaskFromPhaseTaskReportVO {
  int? id;
  String? taskName;
  String? description;
  String? startDate;
  String? endDate;
  int? projectPhaseId;
  int? status;
  int? complete;
  String? progress;
  ProjectPhaseFromProjectPhaseReportVO? projectPhase;

  TaskFromPhaseTaskReportVO(
      {this.id,
      this.taskName,
      this.description,
      this.startDate,
      this.endDate,
      this.projectPhaseId,
      this.status,
      this.complete,
      this.progress,
      this.projectPhase});

  TaskFromPhaseTaskReportVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskName = json['task_name'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    projectPhaseId = json['project_phase_id'];
    status = json['status'];
    complete = json['complete'];
    progress = json['progress'];
    projectPhase = json['project_phase'] != null
        ? new ProjectPhaseFromProjectPhaseReportVO.fromJson(
            json['project_phase'])
        : null;
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
    if (this.projectPhase != null) {
      data['project_phase'] = this.projectPhase!.toJson();
    }
    return data;
  }
}

class ProjectPhaseFromProjectPhaseReportVO {
  int? id;
  String? phaseName;
  String? description;
  String? startDate;
  String? endDate;
  int? userId;
  int? projectId;
  ProjectFromProjectPhaseReportVO? project;

  ProjectPhaseFromProjectPhaseReportVO(
      {this.id,
      this.phaseName,
      this.description,
      this.startDate,
      this.endDate,
      this.userId,
      this.projectId,
      this.project});

  ProjectPhaseFromProjectPhaseReportVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phaseName = json['phase_name'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    userId = json['user_id'];
    projectId = json['project_id'];
    project = json['project'] != null
        ? new ProjectFromProjectPhaseReportVO.fromJson(json['project'])
        : null;
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
    return data;
  }
}

class ProjectFromProjectPhaseReportVO {
  int? id;
  String? name;
  String? description;
  String? estimateDate;
  String? submissionDate;
  String? rfqFilePath;
  int? status;
  int? year;
  int? projectValue;
  int? expectedBudget;
  String? location;
  String? projectContactPerson;
  int? phone;
  String? email;
  Null? projectOwner;
  int? customerId;
  int? roiValue;
  String? team;
  String? createdAt;
  String? updatedAt;

  ProjectFromProjectPhaseReportVO(
      {this.id,
      this.name,
      this.description,
      this.estimateDate,
      this.submissionDate,
      this.rfqFilePath,
      this.status,
      this.year,
      this.projectValue,
      this.expectedBudget,
      this.location,
      this.projectContactPerson,
      this.phone,
      this.email,
      this.projectOwner,
      this.customerId,
      this.roiValue,
      this.team,
      this.createdAt,
      this.updatedAt});

  ProjectFromProjectPhaseReportVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    estimateDate = json['estimate_date'];
    submissionDate = json['submission_date'];
    rfqFilePath = json['rfq_file_path'];
    status = json['status'];
    year = json['year'];
    projectValue = json['project_value'];
    expectedBudget = json['expected_budget'];
    location = json['location'];
    projectContactPerson = json['project_contact_person'];
    phone = json['phone'];
    email = json['email'];
    projectOwner = json['project_owner'];
    customerId = json['customer_id'];
    roiValue = json['roi_value'];
    team = json['team'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['estimate_date'] = this.estimateDate;
    data['submission_date'] = this.submissionDate;
    data['rfq_file_path'] = this.rfqFilePath;
    data['status'] = this.status;
    data['year'] = this.year;
    data['project_value'] = this.projectValue;
    data['expected_budget'] = this.expectedBudget;
    data['location'] = this.location;
    data['project_contact_person'] = this.projectContactPerson;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['project_owner'] = this.projectOwner;
    data['customer_id'] = this.customerId;
    data['roi_value'] = this.roiValue;
    data['team'] = this.team;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
