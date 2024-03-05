import 'package:dartz/dartz.dart';
import 'package:geotagging/features/domain/cuti/interface/Cuti_factory_base.dart';
import 'package:geotagging/features/domain/cuti/interface/cuti_repository_base.dart';
import 'package:geotagging/features/infrastructure/cuti/cuti_factory.dart';
import 'package:geotagging/features/infrastructure/cuti/repository/cuti_repository.dart';
import 'package:get/get.dart';

import '../../app/common/exception.dart';

class CutiAppService {
  final CutiFactoryBase _factory = Get.find<CutiFactory>();
  final CutiRepositoryBase _repository = Get.find<CutiRepository>();

  Future<Either<GenericException, String>> cuti({
    required int pegawaiId,
    required String keterangan,
    required String dari,
    required String sampai,
  }) async {
    final cutiEntities = _factory.create(
        pegawaiId: pegawaiId,
        dari: dari,
        sampai: sampai,
        keterangan: keterangan);

    final res = await _repository.cuti(cutiEntities: cutiEntities);

    return res;
  }
}
