import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/domain/izin/entities/izin_entities.dart';

abstract class IzinRepositoryBase {
  Future<Either<GenericException, String>> izin(
      {required IzinEntities izinEntities});
}
