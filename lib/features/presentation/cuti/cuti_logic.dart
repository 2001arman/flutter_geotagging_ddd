import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geotagging/features/presentation/cuti/cuti_state.dart';
import 'package:geotagging/utility/helper.dart';
import 'package:get/get.dart';

import '../../application/cuti_app_service.dart';
import '../../infrastructure/signin/models/pegawai_profile.dart';

class CutiLogic extends GetxController {
  final CutiAppService _app = Get.find<CutiAppService>();
  final CutiState state = CutiState();
  late PegawaiProfile pegawaiProfile;

  @override
  void onInit() {
    pegawaiProfile = Helper().getPegawaiProfile;
    state.namaController.text = pegawaiProfile.name!;
    state.nipController.text = pegawaiProfile.nip!;
    super.onInit();
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
