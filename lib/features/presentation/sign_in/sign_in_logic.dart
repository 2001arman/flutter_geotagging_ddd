import 'package:geotagging/features/presentation/main_page/main_page_ui.dart';
import 'package:get/get.dart';

class SignInLogic extends GetxController {
  void signIn() {
    Get.toNamed(MainPageUi.namePath);
  }
}
