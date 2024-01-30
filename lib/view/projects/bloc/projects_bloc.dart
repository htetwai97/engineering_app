import 'package:engineering_project/core/core_config/config_text.dart';
import 'package:engineering_project/data/repo_model/engineering_repository.dart';
import 'package:engineering_project/data/repo_model/engineering_repository_impl.dart';
import 'package:engineering_project/data/vos/phase_vo.dart';
import 'package:flutter/foundation.dart';

class ProjectBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final EngineeringRepository _repository = EngineeringRepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  int? employeeId;
  List<PhaseVO?>? phaseList = [];

  ProjectBloc() {
    _showLoading();
    _repository.getInt(EMPLOYEE_ID).then((employeeId) {
      _repository.getProjectPhasesByEmployee(employeeId).then((response) {
        phaseList = response.phases;
        _notifySafely();
        _hideLoading();
      });
    });
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
