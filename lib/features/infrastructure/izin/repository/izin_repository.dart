import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/domain/izin/entities/izin_entities.dart';
import 'package:geotagging/features/domain/izin/interface/izin_repository_base.dart';
import 'package:geotagging/features/infrastructure/izin/data_source/izin_remote_data_source.dart';
import 'package:geotagging/features/infrastructure/izin/models/izin_request.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utility/shared/constants/storage_constants.dart';
import '../../signin/models/pegawai_profile.dart';

class IzinRepository implements IzinRepositoryBase {
  var izinRemoteDataSource = Get.find<IzinRemoteDataSource>();
  var storage = Get.find<SharedPreferences>();

  PegawaiProfile get pegawaiProfile {
    String? pegawai = storage.getString(StorageConstants.pegawai);
    return PegawaiProfile.fromMap(json.decode(pegawai!));
  }

  @override
  Future<Either<GenericException, String>> izin(
      {required IzinEntities izinEntities}) async {
    final res = await izinRemoteDataSource.izin(
      izinRequest: IzinRequest(
        idPegawai: pegawaiProfile.id,
        alasan: izinEntities.alasan,
        keterangan: izinEntities.keterangan,
      ),
    );
    return res;
  }
}
