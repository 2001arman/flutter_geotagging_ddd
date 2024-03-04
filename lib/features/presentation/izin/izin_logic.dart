import 'package:geotagging/features/presentation/izin/izin_state.dart';
import 'package:get/get.dart';

class IzinLogic extends GetxController {
  IzinState state = IzinState();

  void onChangeRadio(String? value) {
    state.groupValue.value = value ?? '';
  }

  void submitIzin() {}
}
