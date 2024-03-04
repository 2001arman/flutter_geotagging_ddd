import 'dart:convert';

import 'package:geotagging/features/application/permission_service.dart';
import 'package:geotagging/features/infrastructure/signin/models/pegawai_profile.dart';
import 'package:geotagging/features/presentation/main_page/main_page_state.dart';
import 'package:geotagging/features/presentation/sign_in/sign_in_ui.dart';
import 'package:geotagging/utility/shared/constants/storage_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPageLogic extends GetxController {
  MainPageState state = MainPageState();
  var notificationServices = Get.find<PermissionService>();
  var storage = Get.find<SharedPreferences>();

  @override
  void onInit() async {
    notificationServices.requestPermission();
    String? pegawai = storage.getString(StorageConstants.pegawai);
    if (pegawai != null) {
      state.pegawai.value = PegawaiProfile.fromMap(json.decode(pegawai));
    }
    super.onInit();
  }

  void logout() {
    storage.clear();
    Get.offNamed(SignInUi.namePath);
  }
}
