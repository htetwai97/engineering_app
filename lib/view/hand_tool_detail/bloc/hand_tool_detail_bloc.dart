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

class HandToolDetailBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final EngineeringRepository _repository = EngineeringRepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  DateTime? date;
  String? remarkDate, remark;
  String? name, brand, type, specs, description, qty, status;
  FocusNode focusNode = FocusNode();

  HandToolDetailBloc() {
    // _showLoading();
  }

  Future onTap() async {}

  void onChangeRemark(String remark) {
    this.remark = remark;
    _notifySafely();
  }

  void onEditingRemarkComplete() {
    focusNode.unfocus();
    _notifySafely();
  }

  void onDatePick(DateTime dateTime) {
    date = dateTime;
    final formatter = DateFormat('yyyy-MM-dd');
    remarkDate = formatter.format(date!);
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
