class ProjectVO {
  int? id;
  String? name;
  String? projectContactPerson;
  int? phone;
  String? email;

  ProjectVO(
      {this.id, this.name, this.projectContactPerson, this.phone, this.email});

  ProjectVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    projectContactPerson = json['project_contact_person'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['project_contact_person'] = this.projectContactPerson;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}