import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AbsensiRepositoryBase {
  Future<Either<GenericException, String>> absensi();

  Future<LatLng> getUserPosition();
}
