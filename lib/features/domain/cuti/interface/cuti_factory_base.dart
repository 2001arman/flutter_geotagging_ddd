import 'package:geotagging/features/domain/cuti/entities/cuti_entities.dart';

abstract class CutiFactoryBase {
  CutiEntities create({
    required int pegawaiId,
    required String keterangan,
    required String dari,
    required String sampai,
  });
}
