import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/app/network/api_provider.dart';
import 'package:geotagging/features/domain/sign_in/models/pegawai_profile_response.dart';
import 'package:geotagging/features/domain/sign_in/models/signin_request.dart';

class SignInRemoteDataSource {
  final ApiProvider _apiProvider = ApiProvider();

  Future<Either<GenericException, PegawaiProfileResponse>> signIn(
      {required SignInRequest signInRequest}) async {
    return await _apiProvider.postData('login', signInRequest.toJson()).then(
          (value) => value.fold((l) {
            return Left(l);
          }, (r) {
            return Right(
              PegawaiProfileResponse.fromMap(r.data),
            );
          }),
        );
  }
}
