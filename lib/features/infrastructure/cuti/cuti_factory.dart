import 'package:geotagging/features/domain/cuti/entities/cuti_entities.dart';

import '../../domain/cuti/interface/Cuti_factory_base.dart';

class CutiFactory implements CutiFactoryBase {
  @override
  CutiEntities create(
      {required int pegawaiId,
      required String keterangan,
      required String dari,
      required String sampai}) {
    return CutiEntities(
        pegawaiId: pegawaiId,
        keterangan: keterangan,
        dari: dari,
        sampai: sampai);
  }
}
