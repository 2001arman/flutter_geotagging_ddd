import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:geotagging/features/presentation/main_page/main_page_ui.dart';
import 'package:geotagging/features/presentation/sign_in/sign_in_ui.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utility/shared/constants/storage_constants.dart';

class SplashScreenLogic extends GetxController with WidgetsBindingObserver {
  final preference = Get.find<SharedPreferences>();
  Future<void> nextRoute() async {
    Get.log('next route kah?');
    final hasToken = preference.getString(StorageConstants.token);
    if (hasToken != null) {
      Get.offAllNamed(MainPageUi.namePath);
    } else {
      Get.offNamed(SignInUi.namePath);
      // Get.offNamedUntil(OnboardingPage.namePath, (route) => false);
    }
    return;
  }

  @override
  void onInit() {
    Get.log('masih init kah');
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onReady() async {
    FlutterNativeSplash.remove();
    await nextRoute();
    super.onReady();
  }

  @override
  void onClose() {
    Get.log('onclose kah?');
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
