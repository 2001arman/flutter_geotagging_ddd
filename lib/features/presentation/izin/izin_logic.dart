import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geotagging/features/application/izin_app_service.dart';
import 'package:geotagging/features/presentation/izin/izin_state.dart';
import 'package:get/get.dart';

class IzinLogic extends GetxController {
  final IzinAppService _app = Get.find<IzinAppService>();
  IzinState state = IzinState();

  void onChangeRadio(String? value) {
    state.groupValue.value = value ?? '';
  }

  bool get isButtonDisable => state.groupValue.value == '';

  void submitIzin() async {
    if (!isButtonDisable) {
      EasyLoading.show();
      final res = await _app.izin(
        alasan: state.groupValue.value,
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
