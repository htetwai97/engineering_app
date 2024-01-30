class RoleVO {
  int? id;
  String? role;

  RoleVO({this.id, this.role});

  RoleVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    return data;
  }
}
