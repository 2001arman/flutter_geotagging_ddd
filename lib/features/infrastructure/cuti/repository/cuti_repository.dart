import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/domain/cuti/entities/cuti_entities.dart';
import 'package:geotagging/features/domain/cuti/interface/cuti_repository_base.dart';
import 'package:geotagging/features/infrastructure/cuti/data_source/cuti_remote_data_source.dart';
import 'package:geotagging/features/domain/cuti/models/cuti_request.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CutiRepository implements CutiRepositoryBase {
  var cutiRemoteDataSource = Get.find<CutiRemoteDataSource>();
  var storage = Get.find<SharedPreferences>();

  @override
  Future<Either<GenericException, String>> cuti(
      {required CutiEntities cutiEntities}) {
    final res = cutiRemoteDataSource.cuti(
      cutiRequest: CutiRequest(
        idPegawai: cutiEntities.pegawaiId,
        keterangan: cutiEntities.keterangan,
        dari: cutiEntities.dari,
        sampai: cutiEntities.sampai,
      ),
    );

    return res;
  }
}
