import 'package:geotagging/features/application/permission_service.dart';
import 'package:get/get.dart';

class MainPageLogic extends GetxController {
  var notificationServices = Get.find<PermissionService>();

  @override
  void onInit() {
    notificationServices.requestPermission();
    super.onInit();
  }
}
