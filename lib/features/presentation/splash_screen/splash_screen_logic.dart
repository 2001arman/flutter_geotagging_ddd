import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:geotagging/features/application/holiday_app_service.dart';
import 'package:geotagging/features/presentation/main_page/main_page_ui.dart';
import 'package:geotagging/features/presentation/sign_in/sign_in_ui.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utility/shared/constants/storage_constants.dart';

class SplashScreenLogic extends GetxController with WidgetsBindingObserver {
  final preference = Get.find<SharedPreferences>();
  final HolidayAppService _holidayApp = Get.find<HolidayAppService>();

  Future<void> nextRoute() async {
    final hasPegawai = preference.getString(StorageConstants.pegawai);
    final holiday = preference.getString(StorageConstants.holiday);
    if (holiday == null) {
      await _holidayApp.getHolidayData();
    }
    if (hasPegawai != null) {
      Get.offAllNamed(MainPageUi.namePath);
    } else {
      Get.offNamed(SignInUi.namePath);
    }
    return;
  }

  @override
  void onInit() async {
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
