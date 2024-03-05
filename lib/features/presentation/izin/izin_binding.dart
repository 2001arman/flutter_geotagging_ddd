import 'package:geotagging/features/application/izin_app_service.dart';
import 'package:geotagging/features/infrastructure/izin/cuti_factory.dart';
import 'package:geotagging/features/infrastructure/izin/data_source/izin_remote_data_source.dart';
import 'package:geotagging/features/infrastructure/izin/repository/izin_repository.dart';
import 'package:geotagging/features/presentation/izin/izin_logic.dart';
import 'package:get/get.dart';

class IzinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IzinLogic());
    Get.lazyPut(() => IzinAppService());
    Get.lazyPut(() => IzinFactory());
    Get.lazyPut(() => IzinRepository());
    Get.lazyPut(() => IzinRemoteDataSource());
  }
}
