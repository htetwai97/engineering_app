import 'package:engineering_project/core/core_config/config_text.dart';
import 'package:engineering_project/data/repo_model/engineering_repository.dart';
import 'package:engineering_project/data/repo_model/engineering_repository_impl.dart';
import 'package:engineering_project/data/vos/product_data_vo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MaterialRequestHistoryBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final EngineeringRepository _repository = EngineeringRepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  List<ProductDataVO>? productDataList = [];
  bool isVisibleNewButton = true;

  MaterialRequestHistoryBloc() {
    _showLoading();
    _repository.getInt(EMPLOYEE_ID).then((value) {
      _repository.getProductDataList().then((response) {
        productDataList = response.data
            ?.where((element) => element.fromEmployeeId == value)
            .toList();
        _notifySafely();
        _hideLoading();
      });
    });
  }

  void onGoScrolling() {
    isVisibleNewButton = false;
    _notifySafely();
  }

  void onStopScrolling() {
    isVisibleNewButton = true;
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
