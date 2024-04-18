import 'package:geotagging/features/application/holiday_app_service.dart';
import 'package:geotagging/features/infrastructure/holiday/data_source/holiday_remote_data_source.dart';
import 'package:geotagging/features/infrastructure/holiday/repository/holiday_repository.dart';
import 'package:geotagging/features/presentation/splash_screen/splash_screen_logic.dart';
import 'package:get/get.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenLogic());
    Get.lazyPut(() => HolidayRepository());
    Get.lazyPut(() => HolidayRemoteDataSource());
    Get.lazyPut(() => HolidayAppService());
  }
}
