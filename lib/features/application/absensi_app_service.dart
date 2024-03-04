import 'package:dartz/dartz.dart';
import 'package:geotagging/features/domain/absensi/interface/absensi_repository_base.dart';
import 'package:geotagging/features/infrastructure/absensi/repository/absensi_repository.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../app/common/exception.dart';

class AbsensiAppService {
  final AbsensiRepositoryBase _repository = Get.find<AbsensiRepository>();

  Future<LatLng> getUserPosition() async {
    return _repository.getUserPosition();
  }

  Future<Either<GenericException, String>> absen() async {
    final res = await _repository.absensi();

    return res;
  }
}
