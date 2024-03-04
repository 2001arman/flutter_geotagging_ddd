import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/domain/absensi/interface/absensi_repository_base.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

class AbsensiRepository implements AbsensiRepositoryBase {
  @override
  Future<Either<GenericException, bool>> absensi() {
    // TODO: implement absensi
    throw UnimplementedError();
  }

  @override
  Future<double> getDistance(
      {required double latitude, required double longitude}) async {
    LatLng currentPosition = await getUserPosition();
    double jarak = Geolocator.distanceBetween(latitude, longitude,
        currentPosition.latitude, currentPosition.longitude);
    return jarak;
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
