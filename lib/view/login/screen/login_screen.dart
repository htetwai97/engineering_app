import 'package:engineering_project/core/core_config/config_color.dart';
import 'package:engineering_project/core/core_config/config_dimens.dart';
import 'package:engineering_project/core/core_config/config_style.dart';
import 'package:engineering_project/core/core_function/functions.dart';
import 'package:engineering_project/view/attendance/screen/attendance_screen.dart';
import 'package:engineering_project/view/bottom_navigation/screen/bottom_navigation_screen_two.dart';
import 'package:engineering_project/view/login/bloc/login_bloc.dart';
import 'package:engineering_project/view/login/widgets/agree_terms_and_condition_view.dart';
import 'package:engineering_project/view/login/widgets/common_text_field_view.dart';
import 'package:engineering_project/view/menu/screen/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        backgroundColor: LOGIN_COLOR_ONE,
        body: Selector<LoginBloc, bool>(
            builder: (context, isLoading, child) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: scaleHeight(context) / 8),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: MATERIAL_COLOR, width: 1),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: const Icon(
                              Icons.person,
                              size: 50,
                              color: MATERIAL_COLOR,
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 10),
                          Consumer<LoginBloc>(
                            builder: (context, bloc, child) =>
                                CommonTextFieldView(
                              renewController: (controller) {},
                              predefinedText: bloc.email,
                              focusNode: bloc.focusNodeEmail,
                              isBorderIncluded: true,
                              labelText: "Email",
                              onChanged: (email) {
                                bloc.onChangeEmail(email);
                              },
                              onEditingComplete: () {
                                bloc.onEditingCompleteEmail();
                              },
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 14),
                          Consumer<LoginBloc>(
                            builder: (context, bloc, child) =>
                                CommonTextFieldView(
                              renewController: (controller) {},
                              visibleEye: true,
                              predefinedText: bloc.password,
                              focusNode: bloc.focusNodePassword,
                              isBorderIncluded: true,
                              labelText: "Password",
                              onChanged: (password) {
                                bloc.onChangePassword(password);
                              },
                              onEditingComplete: () {
                                bloc.onEditingCompletePassword();
                              },
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 14),
                          Consumer<LoginBloc>(
                            builder: (context, bloc, child) =>
                                AgreeTermsAndCondition(
                              enableCheck:
                                  (bloc.email != "" && bloc.password != ""),
                              onCheck: (checkValue) {
                                bloc.onCheckedTermsAndCondition(checkValue);
                              },
                            ),
                          ),
                          SizedBox(height: scaleHeight(context) / 14),
                          Consumer<LoginBloc>(
                            builder: (context, bloc, child) => MaterialButton(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              color: (bloc.isChecked)
                                  ? LOGIN_BUTTON_COLOR
                                  : Colors.grey,
                              onPressed: () {
                                if (bloc.email != "" &&
                                    bloc.password != "" &&
                                    bloc.isChecked == true) {
                                  bloc.onTapLogin().then((value) {
                                    Functions.replacementTransition(
                                        context, const AttendanceScreen());
                                  });
                                }
                                // else {
                                //   Functions.toast(
                                //       msg: "Fields required", status: false);
                                // }
                              },
                              child: SizedBox(
                                width: scaleWidth(context),
                                child: Center(
                                  child: Text(
                                    "LOGIN",
                                    style: ConfigStyle.boldStyle(
                                      16,
                                      MATERIAL_COLOR,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isLoading,
                    child: const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.transparent,
                        color: Colors.amber,
                      ),
                    ),
                  )
                ],
              );
            },
            selector: (context, bloc) => bloc.isLoading),
      ),
    );
  }
}
