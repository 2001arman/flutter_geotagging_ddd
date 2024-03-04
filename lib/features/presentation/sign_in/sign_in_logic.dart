import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geotagging/features/application/sign_in_app_service.dart';
// import 'package:geotagging/features/presentation/main_page/main_page_ui.dart';
import 'package:geotagging/features/presentation/sign_in/sign_in_state.dart';
import 'package:get/get.dart';

import '../main_page/main_page_ui.dart';

class SignInLogic extends GetxController {
  final SigninAppService _app = Get.find<SigninAppService>();
  final SignInState state = SignInState();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool get isButtonDisable {
    return state.password.value == '' || state.email.value == '';
  }

  void onChangeUsername(String value) {
    Get.log(value);
    state.email.value = value;
  }

  void onChangePassword(String value) {
    state.password.value = value;
  }

  void signIn() async {
    if (!isButtonDisable) {
      EasyLoading.show();
      final res = await _app.signIn(
          email: state.email.value, password: state.password.value);
      res.fold((l) => Get.snackbar('Error', l.info), (r) {
        Get.offNamed(MainPageUi.namePath);
      });
      EasyLoading.dismiss();
    }
  }
}
