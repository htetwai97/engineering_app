import 'package:engineering_project/data/vos/room_vo.dart';

class AssetDataVO {
  int? id;
  String? name;
  String? code;
  String? type;
  int? roomId;
  String? purchaseDate;
  int? price;
  int? salvagePrice;
  int? useLife;
  int? yearlyDepriciation;
  int? warranty;
  String? warrantyDocs;
  int? warrantyStatus;
  String? lastMaintenanceDate;
  String? nextMaintenanceDate;
  String? createdAt;
  String? updatedAt;
  RoomVO? room;

  AssetDataVO({
    this.id,
    this.name,
    this.code,
    this.type,
    this.roomId,
    this.purchaseDate,
    this.price,
    this.salvagePrice,
    this.useLife,
    this.yearlyDepriciation,
    this.warranty,
    this.warrantyDocs,
    this.warrantyStatus,
    this.lastMaintenanceDate,
    this.nextMaintenanceDate,
    this.createdAt,
    this.updatedAt,
    this.room,
  });

  AssetDataVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    type = json['type'];
    roomId = json['room_id'];
    purchaseDate = json['purchase_date'];
    price = json['price'];
    salvagePrice = json['salvage_price'];
    useLife = json['use_life'];
    yearlyDepriciation = json['yearly_depriciation'];
    warranty = json['warranty'];
    warrantyDocs = json['warranty_docs'];
    warrantyStatus = json['warranty_status'];
    lastMaintenanceDate = json['last_maintenance_date'];
    nextMaintenanceDate = json['next_maintenance_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    room = json['room'] != null ? new RoomVO.fromJson(json['room']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['type'] = this.type;
    data['room_id'] = this.roomId;
    data['purchase_date'] = this.purchaseDate;
    data['price'] = this.price;
    data['salvage_price'] = this.salvagePrice;
    data['use_life'] = this.useLife;
    data['yearly_depriciation'] = this.yearlyDepriciation;
    data['warranty'] = this.warranty;
    data['warranty_docs'] = this.warrantyDocs;
    data['warranty_status'] = this.warrantyStatus;
    data['last_maintenance_date'] = this.lastMaintenanceDate;
    data['next_maintenance_date'] = this.nextMaintenanceDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    return data;
  }
}
