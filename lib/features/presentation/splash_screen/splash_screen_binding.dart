import 'package:geotagging/features/presentation/splash_screen/splash_screen_logic.dart';
import 'package:get/get.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => ListProfileRemoteDataSource(apiProvider: Get.find()));
    // Get.lazyPut(() => ListProfileAppService());
    // Get.lazyPut(() => ListProfileRepository());
    Get.lazyPut(() => SplashScreenLogic());
  }
}
