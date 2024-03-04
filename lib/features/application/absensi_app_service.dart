import 'package:geotagging/features/domain/absensi/interface/absensi_repository_base.dart';
import 'package:geotagging/features/infrastructure/absensi/repository/absensi_repository.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AbsensiAppService {
  final AbsensiRepositoryBase _repository = Get.find<AbsensiRepository>();

  Future<LatLng> getUserPosition() async {
    return _repository.getUserPosition();
  }
}
