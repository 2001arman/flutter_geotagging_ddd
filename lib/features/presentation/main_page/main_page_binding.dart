import 'package:geotagging/features/application/permission_service.dart';
import 'package:geotagging/features/presentation/main_page/main_page_logic.dart';
import 'package:get/get.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainPageLogic());
    Get.lazyPut(() => PermissionService());
  }
}
