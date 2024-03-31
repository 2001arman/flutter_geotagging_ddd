import 'package:dartz/dartz.dart';

import '../../../../app/common/exception.dart';
import '../../../../app/network/api_provider.dart';
import '../../../domain/cuti/models/cuti_request.dart';

class CutiRemoteDataSource {
  final ApiProvider _apiProvider = ApiProvider();

  Future<Either<GenericException, String>> cuti(
      {required CutiRequest cutiRequest}) async {
    return await _apiProvider.postData('cuti', cutiRequest.toJson()).then(
          (value) => value.fold((l) {
            return Left(l);
          }, (r) {
            return Right(r.data['message']);
          }),
        );
  }
}
