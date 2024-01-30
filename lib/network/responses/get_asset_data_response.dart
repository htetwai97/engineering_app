import 'package:engineering_project/data/vos/asset_data_vo.dart';

class GetAssetDataResponse {
  AssetDataVO? assetData;

  GetAssetDataResponse({this.assetData});

  GetAssetDataResponse.fromJson(Map<String, dynamic> json) {
    assetData = new AssetDataVO.fromJson(json['assetData']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.assetData != null) {
      data['assetData'] = this.assetData?.toJson();
    }
    return data;
  }
}
