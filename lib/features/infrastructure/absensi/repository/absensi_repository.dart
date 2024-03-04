import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/domain/absensi/interface/absensi_repository_base.dart';
import 'package:geotagging/features/infrastructure/absensi/data_source/absensi_remote_data_source.dart';
import 'package:geotagging/features/infrastructure/absensi/models/absensi_request.dart';
import 'package:geotagging/features/infrastructure/signin/models/pegawai_profile.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages, implementation_imports
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utility/shared/constants/storage_constants.dart';

class AbsensiRepository implements AbsensiRepositoryBase {
  var absensiRemoteDataSource = Get.find<AbsensiRemotedataSource>();
  var storage = Get.find<SharedPreferences>();

  @override
  Future<Either<GenericException, String>> absensi() async {
    String? pegawai = storage.getString(StorageConstants.pegawai);
    PegawaiProfile pegawaiProfile =
        PegawaiProfile.fromMap(json.decode(pegawai!));

    final res = await absensiRemoteDataSource.absen(
        absensiRequest: AbsensiRequest(idPegawai: pegawaiProfile.id ?? 0));
    return res.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<LatLng> getUserPosition() async {
    late LatLng currentPosition;
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = LatLng(position.latitude, position.longitude);
    return currentPosition;
  }
}
