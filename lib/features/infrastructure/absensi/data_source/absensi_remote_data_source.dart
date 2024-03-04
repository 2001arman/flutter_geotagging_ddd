import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/infrastructure/absensi/models/absensi_request.dart';

import '../../../../app/network/api_provider.dart';

class AbsensiRemotedataSource {
  final ApiProvider _apiProvider = ApiProvider();

  Future<Either<GenericException, String>> absen(
      {required AbsensiRequest absensiRequest}) async {
    return await _apiProvider.postData('absen', absensiRequest.toJson()).then(
          (value) => value.fold((l) {
            return Left(l);
          }, (r) {
            return Right(r.data['message']);
          }),
        );
  }
}
