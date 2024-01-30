import 'package:engineering_project/data/vos/product_vo.dart';

class MaterialRequestStoreVO {
  int? employeeId;
  int? projectId;
  int? phaseId;
  String? requestDate;
  List<ProductVO>? products;
  String? reason;
  String? requestBy;

  MaterialRequestStoreVO({
    this.employeeId,
    this.projectId,
    this.phaseId,
    this.requestDate,
    this.products,
    this.reason,
    this.requestBy,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_id'] = this.employeeId;
    data['project_id'] = this.projectId;
    data['phase_id'] = this.phaseId;
    data['request_date'] = this.requestDate;
    data['reason'] = this.reason;
    data['requested_by'] = this.requestBy;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
