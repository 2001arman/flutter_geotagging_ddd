import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/domain/sign_in/entities/sign_in.dart';
import 'package:geotagging/features/domain/sign_in/models/pegawai_profile.dart';

abstract class SignInRepositoryBase {
  Future<Either<GenericException, PegawaiProfile>> signIn(
      {required SignInEntities signInEntities});
}
