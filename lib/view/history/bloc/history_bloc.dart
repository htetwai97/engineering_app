import 'package:engineering_project/core/core_config/config_text.dart';
import 'package:engineering_project/data/repo_model/engineering_repository.dart';
import 'package:engineering_project/data/repo_model/engineering_repository_impl.dart';
import 'package:engineering_project/data/vos/data_from_report_vo.dart';
import 'package:engineering_project/data/vos/phase_task_report_vo.dart';
import 'package:flutter/material.dart';
import '../../../network/responses/get_request_list_response.dart';

class HistoryBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final EngineeringRepository _repository = EngineeringRepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  int? employeeId;
  int tabIndex = 0;
  List<PhaseTaskReportVO>? phaseTaskList = [];
  GetRequestListResponse? response;
  List<DataFromReportVO>? maintenanceReportList = [];

  HistoryBloc() {
    _showLoading();
    _repository.getInt(EMPLOYEE_ID).then((value) {
      employeeId = value;
      _notifySafely();
      _repository
          .getMaintenanceReportList(employeeId?.toString() ?? "0")
          .then((response) {
        maintenanceReportList = response.reportList;
        _notifySafely();
        _repository
            .getPhaseTaskReportList(employeeId?.toString() ?? "0")
            .then((response) {
          phaseTaskList = response;
          _hideLoading();
        });
      });
    });
  }

  void onTabChanged(int index) {
    tabIndex = index;
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
