import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geotagging/features/presentation/cuti/cuti_state.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utility/shared/constants/storage_constants.dart';
import '../../application/cuti_app_service.dart';
import '../../infrastructure/signin/models/pegawai_profile.dart';

class CutiLogic extends GetxController {
  final CutiAppService _app = Get.find<CutiAppService>();
  final CutiState state = CutiState();
  var storage = Get.find<SharedPreferences>();

  @override
  void onInit() {
    state.namaController.text = pegawaiProfile.name!;
    state.nipController.text = pegawaiProfile.nip!;
    super.onInit();
  }

  PegawaiProfile get pegawaiProfile {
    String? pegawai = storage.getString(StorageConstants.pegawai);
    return PegawaiProfile.fromMap(json.decode(pegawai!));
  }

  bool get isButtonDisable =>
      state.sampai.value == '' ||
      state.mulaiDari.value == '' ||
      state.keterangan.value == '';

  void setMulaiDari(String value) => state.mulaiDari.value = value;

  void setSampai(String value) => state.sampai.value = value;

  void setKeterangan(String value) => state.keterangan.value = value;

  void submitCuti() async {
    if (!isButtonDisable) {
      EasyLoading.show();
      final res = await _app.cuti(
        pegawaiId: pegawaiProfile.id,
        dari: state.mulaiDari.value,
        sampai: state.sampai.value,
        keterangan: state.keteranganController.text,
      );
      res.fold(
        (l) => Get.snackbar('Error', l.info),
        (r) => Get.snackbar("Success", r),
      );
      EasyLoading.dismiss();
    }
  }
}
