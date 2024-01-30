import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/data/repo_model/engineering_repository.dart';
import 'package:engineering_project/data/repo_model/engineering_repository_impl.dart';
import 'package:engineering_project/data/vos/user_vo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../core/core_config/config_text.dart';
import '../../../data/vos/employee_vo.dart';

class LoginBloc extends ChangeNotifier {
  /// Bloc state
  bool isDisposed = false;

  /// Dependencies
  final EngineeringRepository _repository = EngineeringRepositoryImpl();

  /// Loading State
  bool isLoading = false;

  /// Screen states
  String email = "e1@gmail.com";
  String password = "eng123@";
  bool isChecked = false;
  EmployeeVO? employeeVO;
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodePassword = FocusNode();

  LoginBloc();

  void onChangeEmail(String email) {
    this.email = email;
    _notifySafely();
  }

  void onChangePassword(String password) {
    this.password = password;
    _notifySafely();
  }

  void onEditingCompleteEmail() {
    focusNodeEmail.unfocus();
    _notifySafely();
  }

  void onCheckedTermsAndCondition(bool checkValue) {
    isChecked = checkValue;
    _notifySafely();
  }

  void onEditingCompletePassword() {
    focusNodePassword.unfocus();
    _notifySafely();
  }

  Future onTapLogin() async {
    _showLoading();
    await _repository.postUserLogin(email, password).then((response) {
      employeeVO = response.employee;
      _notifySafely();
      _hideLoading();
    }).catchError((error) {
      _hideLoading();
      Functions.toast(msg: "Login failed", status: false);
    });

    if (employeeVO != null) {
      await _repository.saveInt(EMPLOYEE_ID, employeeVO?.id ?? 0);
      await _repository.saveString(NAME, employeeVO?.name ?? "");
      await _repository.saveString(EMAIL, employeeVO?.email ?? "");
      return Future.value();
    } else {
      return Future.error("error");
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
