import 'package:engineering_project/data/vos/role_vo.dart';
import 'package:engineering_project/data/vos/user_vo.dart';

class EmployeeVO {
  int? id, userId, roleId;
  String? name, email;
  UserVO? user;
  RoleVO? role;

  EmployeeVO(
      {this.id,
      this.name,
      this.email,
      this.userId,
      this.roleId,
      this.user,
      this.role});

  EmployeeVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    userId = json['user_id'];
    roleId = json['role_id'];
    user = json['user'] != null ? new UserVO.fromJson(json['user']) : null;
    role = json['role'] != null ? new RoleVO.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['user_id'] = this.userId;
    data['role_id'] = this.roleId;
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    if (this.role != null) {
      data['role'] = this.role?.toJson();
    }
    return data;
  }
}
