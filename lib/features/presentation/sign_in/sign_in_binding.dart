import 'package:geotagging/features/presentation/sign_in/sign_in_logic.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInLogic());
  }
}
