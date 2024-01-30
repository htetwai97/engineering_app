class GetProjectPhaseForMaterialRequestResponse {
  List<ProjectForMaterialRequestVO>? project;
  List<UserForMaterialRequestVO>? user;

  GetProjectPhaseForMaterialRequestResponse({this.project, this.user});

  GetProjectPhaseForMaterialRequestResponse.fromJson(
      Map<String, dynamic> json) {
    if (json['project'] != null) {
      project = <ProjectForMaterialRequestVO>[];
      json['project'].forEach((v) {
        project!.add(new ProjectForMaterialRequestVO.fromJson(v));
      });
    }
    if (json['user'] != null) {
      user = <UserForMaterialRequestVO>[];
      json['user'].forEach((v) {
        user!.add(new UserForMaterialRequestVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.project != null) {
      data['project'] = this.project!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectForMaterialRequestVO {
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
  String? projectOwner;
  int? customerId;
  int? roiValue;
  String? team;
  String? createdAt;
  String? updatedAt;
  List<PhaseForMaterialRequestVO>? phases;

  ProjectForMaterialRequestVO(
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
        this.updatedAt,
        this.phases});

  ProjectForMaterialRequestVO.fromJson(Map<String, dynamic> json) {
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
    if (json['phases'] != null) {
      phases = <PhaseForMaterialRequestVO>[];
      json['phases'].forEach((v) {
        phases!.add(new PhaseForMaterialRequestVO.fromJson(v));
      });
    }
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
    if (this.phases != null) {
      data['phases'] = this.phases!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PhaseForMaterialRequestVO {
  int? id;
  String? phaseName;
  String? description;
  String? startDate;
  String? endDate;
  int? userId;
  int? projectId;

  PhaseForMaterialRequestVO(
      {this.id,
        this.phaseName,
        this.description,
        this.startDate,
        this.endDate,
        this.userId,
        this.projectId});

  PhaseForMaterialRequestVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phaseName = json['phase_name'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    userId = json['user_id'];
    projectId = json['project_id'];
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
    return data;
  }
}

class UserForMaterialRequestVO {
  int? id;
  String? name;
  String? email;
  int? workSiteId;
  String? emailVerifiedAt;

  UserForMaterialRequestVO({this.id, this.name, this.email, this.workSiteId, this.emailVerifiedAt});

  UserForMaterialRequestVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    workSiteId = json['work_site_id'];
    emailVerifiedAt = json['email_verified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['work_site_id'] = this.workSiteId;
    data['email_verified_at'] = this.emailVerifiedAt;
    return data;
  }
}