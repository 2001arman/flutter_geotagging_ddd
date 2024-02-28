import 'package:geotagging/features/presentation/izin/izin_logic.dart';
import 'package:get/get.dart';

class IzinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IzinLogic());
  }
}
