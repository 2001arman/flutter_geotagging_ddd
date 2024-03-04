import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/infrastructure/izin/models/izin_request.dart';

import '../../../../app/network/api_provider.dart';

class IzinRemoteDataSource {
  final ApiProvider _apiProvider = ApiProvider();

  Future<Either<GenericException, String>> izin(
      {required IzinRequest izinRequest}) async {
    return await _apiProvider.postData('izin', izinRequest.toJson()).then(
          (value) => value.fold((l) {
            return Left(l);
          }, (r) {
            return Right(r.data['message']);
          }),
        );
  }
}
