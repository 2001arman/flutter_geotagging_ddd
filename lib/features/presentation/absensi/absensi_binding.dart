import 'package:geotagging/features/presentation/absensi/absensi_logic.dart';
import 'package:get/get.dart';

class AbsensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AbsensiLogic());
  }
}
