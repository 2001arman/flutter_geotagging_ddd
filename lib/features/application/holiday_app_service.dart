import 'package:dartz/dartz.dart';
import 'package:geotagging/features/domain/holiday/models/holiday_response.dart';
import 'package:get/get.dart';

import '../../app/common/exception.dart';
import '../domain/holiday/interface/holiday_repository_base.dart';
import '../infrastructure/holiday/repository/holiday_repository.dart';

class HolidayAppService {
  final HolidayRepositoryBase _repository = Get.find<HolidayRepository>();

  Future<Either<GenericException, List<HolidayModel>>> getHolidayData() async {
    final res = await _repository.getHolidayData();

    return res;
  }
}
