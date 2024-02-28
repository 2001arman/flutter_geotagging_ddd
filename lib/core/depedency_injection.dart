import 'package:get/get.dart';

import '../utility/shared/services/storage_service.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
    // await Get.putAsync(() => NotificationServices().init());
  }
}
