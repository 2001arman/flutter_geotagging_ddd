import 'package:geotagging/features/domain/izin/entities/izin_entities.dart';

abstract class IzinFactoryBase {
  IzinEntities create({
    required int idPegawai,
    required String keterangan,
    required String alasan,
  });
}
