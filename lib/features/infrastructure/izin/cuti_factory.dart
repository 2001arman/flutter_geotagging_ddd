import 'package:geotagging/features/domain/izin/entities/izin_entities.dart';

import '../../domain/izin/interface/izin_factory_base.dart';

class IzinFactory implements IzinFactoryBase {
  @override
  IzinEntities create({required String keterangan, required String alasan}) {
    return IzinEntities(keterangan: keterangan, alasan: alasan);
  }
}
