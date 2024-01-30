import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/data/repo_model/engineering_repository.dart';
import 'package:engineering_project/data/repo_model/engineering_repository_impl.dart';
import 'package:engineering_project/data/vos/request_maintenance_asset_vo.dart';
import 'package:engineering_project/data/vos/request_maintenance_building_vo.dart';
import 'package:engineering_project/data/vos/request_maintenance_form_vo.dart';
import 'package:engineering_project/data/vos/request_maintenance_room_vo.dart';
import 'package:engineering_project/network/responses/get_room_building_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class RequestMaintenanceBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final EngineeringRepository _repository = EngineeringRepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  String? requestNo;
  String? requestDate, dueDate;
  String? condition, reqRemark;
  DateTime? date;
  int? assetId;

  FocusNode fNodeRequestNo = FocusNode();
  FocusNode fNodeCondition = FocusNode();
  FocusNode fNodeReqRemark = FocusNode();

  GetRoomBuildingResponse? response;
  List<RequestMaintenanceRoomVO>? roomVOList = [];
  List<String> roomList = [];
  List<RequestMaintenanceBuildingVO>? buildingVOList = [];
  List<String> buildingList = [];
  List<RequestMaintenanceAssetVO>? assetVOList = [];
  List<String> assetList = [];
  RequestMaintenanceAssetVO? selectedAsset;

  RequestMaintenanceBloc({RequestMaintenanceAssetVO? selectedAsset}) {
    _showLoading();
    this.selectedAsset = selectedAsset;
    assetId = this.selectedAsset?.id;
    _notifySafely();
    _repository.getRoomBuilding().then((response) {
      this.response = response;
      buildingVOList = this.response?.buildings;
      buildingList = buildingVOList?.map((e) => e.name ?? "").toList() ?? [];
      _notifySafely();
      _hideLoading();
    });
  }

  Future onTapRequest() async {
    _showLoading();
    bool isComplete = _isComplete();
    if (isComplete) {
      var formVO = RequestMaintenanceFormVO(
        requestNo: requestNo,
        requestDate: requestDate,
        dueDate: dueDate,
        assetId: assetId,
        condition: condition,
        requirementRemark: reqRemark,
      );
      await _repository.postMaintenanceRequestStore(formVO);
      _hideLoading();
      return Future.value();
    } else {
      Functions.toast(msg: "Fields Required!", status: false);
      _hideLoading();
      return Future.error("error");
    }
  }

  bool _isComplete() {
    return (requestNo != null &&
        requestNo != "" &&
        requestDate != null &&
        requestDate != "" &&
        dueDate != null &&
        dueDate != "" &&
        assetId != null &&
        condition != null &&
        condition != "" &&
        reqRemark != null &&
        reqRemark != "");
  }

  void onChooseBuilding(String building) {
    _showLoading();
    var buildings =
        buildingVOList?.where((element) => element.name == building).toList();
    buildings?.take(1);
    var buildingVO = buildings?.elementAt(0);
    roomVOList =
        response?.room?.where((e) => e.buildingId == buildingVO?.id).toList();
    roomList = roomVOList?.map((e) => e.roomNumber ?? "").toList() ?? [];
    _notifySafely();
    _hideLoading();
  }

  void onChooseRoom(String room) {
    _showLoading();
    var rooms =
        roomVOList?.where((element) => element.roomNumber == room).toList();
    rooms?.take(1);
    var roomVO = rooms?.elementAt(0);
    assetVOList = roomVO?.assetRequest;
    assetList = assetVOList?.map((e) => e.name ?? "").toList() ?? [];
    _notifySafely();
    _hideLoading();
  }

  void onChooseAsset(String asset) {
    _showLoading();
    var assets =
        assetVOList?.where((element) => element.name == asset).toList();
    assets?.take(1);
    var assetVO = assets?.elementAt(0);
    assetId = assetVO?.id;
    _notifySafely();
    _hideLoading();
  }

  void onChangeRequestNo(String no) {
    requestNo = no;
    _notifySafely();
  }

  void onChangeCondition(String condition) {
    this.condition = condition;
    _notifySafely();
  }

  void onChangeReqRemark(String reqRemark) {
    this.reqRemark = reqRemark;
    _notifySafely();
  }

  void onEditingCompleteRequestNo() {
    fNodeRequestNo.unfocus();
    _notifySafely();
  }

  void onEditingCompleteCondition() {
    fNodeCondition.unfocus();
    _notifySafely();
  }

  void onEditingCompleteReqRemark() {
    fNodeReqRemark.unfocus();
    _notifySafely();
  }

  void onRequestDatePick(DateTime dateTime) {
    date = dateTime;
    final formatter = DateFormat('yyyy-MM-dd');
    requestDate = formatter.format(date!);
    _notifySafely();
  }

  void onDueDatePick(DateTime dateTime) {
    date = dateTime;
    final formatter = DateFormat('yyyy-MM-dd');
    dueDate = formatter.format(date!);
    _notifySafely();
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
