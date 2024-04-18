import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/domain/holiday/models/holiday_response.dart';
import 'package:geotagging/features/infrastructure/holiday/data_source/holiday_remote_data_source.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../utility/shared/constants/storage_constants.dart';
import '../../../domain/holiday/interface/holiday_repository_base.dart';

class HolidayRepository implements HolidayRepositoryBase {
  var holidayRemoteDataSource = Get.find<HolidayRemoteDataSource>();
  var storage = Get.find<SharedPreferences>();

  @override
  Future<Either<GenericException, List<HolidayModel>>> getHolidayData() async {
    final res = await holidayRemoteDataSource.getHolidayData();

    return res.fold((l) => Left(l), (r) {
      String holidayDataJson = json.encode(r.map((e) => e.toMap()).toList());
      storage.setString(StorageConstants.holiday, holidayDataJson);
      return Right(r);
    });
  }
}
