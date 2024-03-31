import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/domain/sign_in/entities/sign_in.dart';
import 'package:geotagging/features/domain/sign_in/interface/sign_in_repository_base.dart';
import 'package:geotagging/features/domain/sign_in/models/pegawai_profile.dart';
import 'package:geotagging/features/domain/sign_in/models/signin_request.dart';
import 'package:geotagging/utility/shared/constants/storage_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data_source/sign_in_remote_data_source.dart';

class SignInRepository implements SignInRepositoryBase {
  var signInRemoteDataSource = Get.find<SignInRemoteDataSource>();
  var storage = Get.find<SharedPreferences>();

  @override
  Future<Either<GenericException, PegawaiProfile>> signIn(
      {required SignInEntities signInEntities}) async {
    final res = await signInRemoteDataSource.signIn(
      signInRequest: SignInRequest(
        password: signInEntities.password,
        email: signInEntities.email,
      ),
    );

    return res.fold((l) => Left(l), (r) {
      storage.setString(
          StorageConstants.pegawai, json.encode(r.pegawai!.toMap()));
      return Right(
        PegawaiProfile.fromMap(
          r.pegawai!.toMap(),
        ),
      );
    });
  }
}
