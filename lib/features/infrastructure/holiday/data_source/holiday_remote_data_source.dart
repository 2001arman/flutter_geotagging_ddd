import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/app/network/api_provider.dart';
import 'package:geotagging/features/domain/holiday/models/holiday_response.dart';

class HolidayRemoteDataSource {
  final ApiProvider _apiProvider = ApiProvider();

  Future<Either<GenericException, List<HolidayModel>>> getHolidayData() async {
    return await _apiProvider.getData('holiday').then(
          (value) => value.fold((l) {
            return Left(l);
          }, (r) {
            final data = HolidayResponse.fromMap(r.data);
            return Right(data.data);
          }),
        );
  }
}
