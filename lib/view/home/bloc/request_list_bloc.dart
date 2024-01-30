import 'package:engineering_project/core/core_config/config_text.dart';
import 'package:engineering_project/network/responses/get_request_list_response.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/core_function/functions.dart';
import '../../../data/vos/request_data_vo.dart';
import '../../../data/repo_model/engineering_repository.dart';
import '../../../data/repo_model/engineering_repository_impl.dart';

class RequestListBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final EngineeringRepository _repository = EngineeringRepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  int? employeeId;
  String? name, email;
  List<RequestsVO>? requestDataList = [];
  List<String?> dueDateList = [];
  GetRequestListResponse? response;

  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodePassword = FocusNode();

  RequestListBloc() {
    _showLoading();
    _repository.getInt(EMPLOYEE_ID).then((value) {
      _repository.getRequestListById(value).then((response) {
        this.response = response;
        requestDataList = this.response?.requests;
        dueDateList = requestDataList?.map((e) => e.dueDate).toList() ?? [];
        _notifySafely();
        _hideLoading();
      });
    });
  }

  void onTapDate(String date) {
    requestDataList = response?.requests
        ?.where((element) => element.dueDate == date)
        .toList();
    Functions.toast(msg: "$dueDateList");
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
