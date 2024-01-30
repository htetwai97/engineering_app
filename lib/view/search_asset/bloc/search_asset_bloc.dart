import 'package:engineering_project/data/repo_model/engineering_repository.dart';
import 'package:engineering_project/data/repo_model/engineering_repository_impl.dart';
import 'package:engineering_project/data/vos/asset_data_vo.dart';
import 'package:engineering_project/data/vos/request_maintenance_asset_vo.dart';
import 'package:engineering_project/data/vos/request_maintenance_building_vo.dart';
import 'package:engineering_project/data/vos/request_maintenance_room_vo.dart';
import 'package:engineering_project/network/responses/get_room_building_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchAssetBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final EngineeringRepository _repository = EngineeringRepositoryImpl();

  /// Loading State
  bool isLoading = false;
  bool isApiCalling = false;

  /// Screen states

  GetRoomBuildingResponse? response;
  List<RequestMaintenanceRoomVO>? roomVOList = [];
  List<String> roomList = [];
  List<RequestMaintenanceBuildingVO>? buildingVOList = [];
  List<String> buildingList = [];
  List<RequestMaintenanceAssetVO>? assetVOList = [];
  List<RequestMaintenanceAssetVO>? displayAssetList = [];
  FocusNode focusNode = FocusNode();
  String? serialNumber;
  AssetDataVO? assetDataVO;
  String? selectedBuilding;
  String? selectedRoom;

  SearchAssetBloc() {
    _showLoading();
    _repository.getRoomBuilding().then((response) {
      this.response = response;
      buildingVOList = this.response?.buildings;
      buildingList = buildingVOList?.map((e) => e.name ?? "").toList() ?? [];
      _notifySafely();
      _repository.getSearchAssets().then((searchAssetResponse) {
        assetVOList = searchAssetResponse.data;
        displayAssetList = searchAssetResponse.data;
        _notifySafely();
        _hideLoading();
      });
    });
  }

  Future<AssetDataVO?> onTapDetail(RequestMaintenanceAssetVO? asset) async {
    isApiCalling = true;
    _notifySafely();
    var response = await _repository.getAssetData(asset?.id ?? 1);
    isApiCalling = false;
    _notifySafely();
    return Future.value(response.assetData);
  }

  void onChooseBuilding(String building) {
    _showLoading();
    Future.delayed(const Duration(milliseconds: 600)).then((value) {
      selectedBuilding = building;
      selectedRoom = null;
      var buildings =
          buildingVOList?.where((element) => element.name == building).toList();
      buildings?.take(1);
      var buildingVO = buildings?.elementAt(0);
      roomVOList =
          response?.room?.where((e) => e.buildingId == buildingVO?.id).toList();
      roomList = roomVOList?.map((e) => e.roomNumber ?? "").toList() ?? [];
      displayAssetList = [];
      _notifySafely();
      _hideLoading();
    });
  }

  void onEditCompleteSearch() {
    focusNode.unfocus();
    _notifySafely();
  }

  void onChooseRoom(String roomNumber) {
    _showLoading();
    Future.delayed(const Duration(milliseconds: 600)).then((value) {
      selectedRoom = roomNumber;
      var rooms = roomVOList
          ?.where((element) => element.roomNumber == roomNumber)
          .toList();
      rooms?.take(1);
      var roomVO = rooms?.elementAt(0);
      displayAssetList = roomVO?.assetRequest;
      _notifySafely();
      _hideLoading();
    });
  }

  void onChangeSerialNo(String serialNo) {
    serialNumber = serialNo.toLowerCase().replaceAll("_", "");
    _notifySafely();
  }

  void onTapSearch() {
    if (serialNumber != null && serialNumber != "") {
      displayAssetList = assetVOList
          ?.where((element) =>
              element.code
                  ?.toLowerCase()
                  .replaceAll("_", "")
                  .contains(serialNumber ?? "") ??
              false)
          .toList();
      _notifySafely();
    }
  }

  /// loading situations
  void _showLoading() {
    isLoading = true;
    _notifySafely();
  }

  void _hideLoading() {
    isLoading = false;
    _notifySafely();
  }

  void _notifySafely() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }
}
