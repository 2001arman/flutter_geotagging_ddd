import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/infrastructure/absensi/models/absensi_request.dart';
import 'package:geotagging/features/infrastructure/absensi/models/riwayat_absensi_response.dart';

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

  Future<Either<GenericException, RiwayatAbsensiResponse>> riwayatAbsensi(
      {required AbsensiRequest absensiRequest}) async {
    final res = await _apiProvider
        .getData('riwayat-absensi/${absensiRequest.idPegawai}');

    return res.fold(
      (l) => Left(l),
      (r) => Right(
        RiwayatAbsensiResponse.fromMap(r.data),
      ),
    );
  }
}
