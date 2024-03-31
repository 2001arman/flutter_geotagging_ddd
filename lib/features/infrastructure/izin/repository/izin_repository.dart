import 'package:dartz/dartz.dart';
import 'package:geotagging/app/common/exception.dart';
import 'package:geotagging/features/domain/izin/entities/izin_entities.dart';
import 'package:geotagging/features/domain/izin/interface/izin_repository_base.dart';
import 'package:geotagging/features/infrastructure/izin/data_source/izin_remote_data_source.dart';
import 'package:geotagging/features/domain/izin/models/izin_request.dart';
import 'package:geotagging/utility/helper.dart';
import 'package:get/get.dart';
import '../../../domain/sign_in/models/pegawai_profile.dart';

class IzinRepository implements IzinRepositoryBase {
  var izinRemoteDataSource = Get.find<IzinRemoteDataSource>();
  PegawaiProfile pegawaiProfile = Helper().getPegawaiProfile;

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
