import 'package:geotagging/features/presentation/riwayat_absensi/riwayat_absensi_logic.dart';
import 'package:get/get.dart';

class RiwayatAbsensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RiwayatAbsensiLogic());
  }
}
