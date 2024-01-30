import 'package:engineering_project/data/vos/delivery_item_vo.dart';

class DeliveryOrderVO {
  int? id;
  String? doNo;
  int? requestMaterialId;
  int? materialIssueId;
  int? purchaseOrderId;
  int? warehouseTransferId;
  int? projectId;
  String? project;
  int? projectPhaseId;
  String? projectPhase;
  int? userId;
  String? receivePerson;
  String? customerName;
  int? phone;
  String? deliveryDate;
  String? dispatchDate;
  String? location;
  int? status;
  int? approve;
  int? receiveStatus;
  List<DeliveryItemVO>? deliveryOrderList;

  DeliveryOrderVO(
      {this.id,
      this.doNo,
      this.requestMaterialId,
      this.materialIssueId,
      this.purchaseOrderId,
      this.warehouseTransferId,
      this.projectId,
      this.project,
      this.projectPhaseId,
      this.projectPhase,
      this.userId,
      this.receivePerson,
      this.customerName,
      this.phone,
      this.deliveryDate,
      this.dispatchDate,
      this.location,
      this.status,
      this.approve,
      this.receiveStatus,
      this.deliveryOrderList});

  DeliveryOrderVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doNo = json['do_no'];
    requestMaterialId = json['request_material_id'];
    materialIssueId = json['material_issue_id'];
    purchaseOrderId = json['purchase_order_id'];
    warehouseTransferId = json['warehouse_transfer_id'];
    projectId = json['project_id'];
    project = json['project'];
    projectPhaseId = json['project_phase_id'];
    projectPhase = json['project_phase'];
    userId = json['user_id'];
    receivePerson = json['receive_person'];
    customerName = json['customer_name'];
    phone = json['phone'];
    deliveryDate = json['delivery_date'];
    dispatchDate = json['dispatch_date'];
    location = json['location'];
    status = json['status'];
    receiveStatus = json['receive_status'];
    approve = json['approve'];
    if (json['delivery_order_list'] != null) {
      deliveryOrderList = <DeliveryItemVO>[];
      json['delivery_order_list'].forEach((v) {
        deliveryOrderList!.add(new DeliveryItemVO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['do_no'] = this.doNo;
    data['request_material_id'] = this.requestMaterialId;
    data['material_issue_id'] = this.materialIssueId;
    data['purchase_order_id'] = this.purchaseOrderId;
    data['warehouse_transfer_id'] = this.warehouseTransferId;
    data['project_id'] = this.projectId;
    data['project'] = this.project;
    data['project_phase_id'] = this.projectPhaseId;
    data['project_phase'] = this.projectPhase;
    data['user_id'] = this.userId;
    data['receive_person'] = this.receivePerson;
    data['customer_name'] = this.customerName;
    data['phone'] = this.phone;
    data['delivery_date'] = this.deliveryDate;
    data['dispatch_date'] = this.dispatchDate;
    data['location'] = this.location;
    data['status'] = this.status;
    data['receive_status'] = this.receiveStatus;
    data['approve'] = this.approve;
    if (this.deliveryOrderList != null) {
      data['delivery_order_list'] =
          this.deliveryOrderList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
