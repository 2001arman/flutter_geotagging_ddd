import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/domain/sign_in/models/pegawai_profile.dart';
import 'package:get/get.dart';

import '../domain/sign_in/interface/sign_in_factory_base.dart';
import '../domain/sign_in/interface/sign_in_repository_base.dart';
import '../infrastructure/signin/repository/sign_in_repository.dart';
import '../infrastructure/signin/sign_in_factory.dart';

class SigninAppService {
  final SignInFactoryBase _factory = Get.find<SignInFactory>();
  final SignInRepositoryBase _repository = Get.find<SignInRepository>();

  Future<Either<GenericException, PegawaiProfile>> signIn({
    required String email,
    required String password,
  }) async {
    final signInEntities = _factory.create(email: email, password: password);

    final res = await _repository.signIn(signInEntities: signInEntities);

    return res;
  }
}
