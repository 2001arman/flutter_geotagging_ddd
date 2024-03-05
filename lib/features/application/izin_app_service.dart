import 'package:dartz/dartz.dart';
import 'package:geotagging/features/domain/izin/interface/izin_factory_base.dart';
import 'package:geotagging/features/domain/izin/interface/izin_repository_base.dart';
import 'package:geotagging/features/infrastructure/izin/izin_factory.dart';
import 'package:geotagging/features/infrastructure/izin/repository/izin_repository.dart';
import 'package:get/get.dart';

import '../../app/common/exception.dart';

class IzinAppService {
  final IzinFactoryBase _factory = Get.find<IzinFactory>();
  final IzinRepositoryBase _repository = Get.find<IzinRepository>();

  Future<Either<GenericException, String>> izin({
    required String alasan,
    required String keterangan,
  }) async {
    final signInEntities =
        _factory.create(alasan: alasan, keterangan: keterangan);

    final res = await _repository.izin(izinEntities: signInEntities);

    return res;
  }
}
