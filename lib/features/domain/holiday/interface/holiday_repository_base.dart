import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/domain/holiday/models/holiday_response.dart';

abstract class HolidayRepositoryBase {
  Future<Either<GenericException, List<HolidayModel>>> getHolidayData();
}
