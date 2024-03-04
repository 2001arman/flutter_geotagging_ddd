import 'package:geotagging/features/application/absensi_app_service.dart';
import 'package:geotagging/features/infrastructure/absensi/data_source/absensi_remote_data_source.dart';
import 'package:geotagging/features/infrastructure/absensi/repository/absensi_repository.dart';
import 'package:geotagging/features/presentation/riwayat_absensi/riwayat_absensi_logic.dart';
import 'package:get/get.dart';

class RiwayatAbsensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RiwayatAbsensiLogic());
    Get.lazyPut(() => AbsensiAppService());
    Get.lazyPut(() => AbsensiRepository());
    Get.lazyPut(() => AbsensiRemotedataSource());
  }
}
