import 'package:geotagging/features/application/sign_in_app_service.dart';
import 'package:geotagging/features/presentation/sign_in/sign_in_logic.dart';
import 'package:get/get.dart';

import '../../infrastructure/signin/data_source/sign_in_remote_data_source.dart';
import '../../infrastructure/signin/repository/sign_in_repository.dart';
import '../../infrastructure/signin/sign_in_factory.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInLogic());

    // module sign in
    Get.lazyPut(() => SignInRemoteDataSource());
    Get.lazyPut(() => SigninAppService());
    Get.lazyPut(() => SignInFactory());
    Get.lazyPut(() => SignInRepository());
  }
}
