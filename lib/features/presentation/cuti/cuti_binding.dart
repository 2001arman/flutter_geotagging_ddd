import 'package:geotagging/features/application/cuti_app_service.dart';
import 'package:geotagging/features/infrastructure/cuti/cuti_factory.dart';
import 'package:geotagging/features/infrastructure/cuti/data_source/cuti_remote_data_source.dart';
import 'package:geotagging/features/infrastructure/cuti/repository/cuti_repository.dart';
import 'package:geotagging/features/presentation/cuti/cuti_logic.dart';
import 'package:get/get.dart';

class CutiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CutiLogic());
    Get.lazyPut(() => CutiAppService());
    Get.lazyPut(() => CutiFactory());
    Get.lazyPut(() => CutiRepository());
    Get.lazyPut(() => CutiRemoteDataSource());
  }
}
