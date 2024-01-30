import 'package:flutter/cupertino.dart';

import '../../../data/repo_model/engineering_repository.dart';
import '../../../data/repo_model/engineering_repository_impl.dart';
import '../../../data/vos/asset_data_vo.dart';
import '../../../core/core_function/functions.dart';

class RequestDetailBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final EngineeringRepository _repository = EngineeringRepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  int assetId;
  AssetDataVO? asset;

  RequestDetailBloc(this.assetId) {
    _showLoading();
    _repository.getAssetData(assetId).then((value) {
      Functions.toast(msg: "${value.assetData?.id}");
      asset = value.assetData;
      _hideLoading();
      _notifySafely();
    }).onError((error, stackTrace) => Functions.toast(msg: "${error}"));
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
