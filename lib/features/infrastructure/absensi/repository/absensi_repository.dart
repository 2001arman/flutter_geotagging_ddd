import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/domain/absensi/interface/absensi_repository_base.dart';
import 'package:geotagging/features/infrastructure/absensi/data_source/absensi_remote_data_source.dart';
import 'package:geotagging/features/domain/absensi/models/absensi_request.dart';
import 'package:geotagging/features/domain/absensi/models/riwayat_absensi_response.dart';
import 'package:geotagging/features/domain/sign_in/models/pegawai_profile.dart';
import 'package:geotagging/utility/helper.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages, implementation_imports
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

class AbsensiRepository implements AbsensiRepositoryBase {
  var absensiRemoteDataSource = Get.find<AbsensiRemotedataSource>();
  PegawaiProfile pegawaiProfile = Helper().getPegawaiProfile;

  @override
  Future<LatLng> getUserPosition() async {
    late LatLng currentPosition;
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = LatLng(position.latitude, position.longitude);
    return currentPosition;
  }

  @override
  Future<Either<GenericException, String>> absensi() async {
    final res = await absensiRemoteDataSource.absen(
        absensiRequest: AbsensiRequest(idPegawai: pegawaiProfile.id));
    return res;
  }

  @override
  Future<Either<GenericException, RiwayatAbsensiResponse>>
      riwayatAbsensi() async {
    final res = await absensiRemoteDataSource.riwayatAbsensi(
      absensiRequest: AbsensiRequest(idPegawai: pegawaiProfile.id),
    );

    return res;
  }
}
