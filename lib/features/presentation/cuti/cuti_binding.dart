import 'package:geotagging/features/presentation/cuti/cuti_logic.dart';
import 'package:get/get.dart';

class CutiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CutiLogic());
  }
}
