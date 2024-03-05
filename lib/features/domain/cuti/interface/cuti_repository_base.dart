import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/domain/cuti/entities/cuti_entities.dart';

abstract class CutiRepositoryBase {
  Future<Either<GenericException, String>> cuti(
      {required CutiEntities cutiEntities});
}
