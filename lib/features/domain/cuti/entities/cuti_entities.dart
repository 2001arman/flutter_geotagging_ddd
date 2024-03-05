class CutiEntities {
  final int _pegawaiId;
  final String _keterangan;
  final String _dari;
  final String _sampai;

  CutiEntities({
    required int pegawaiId,
    required String keterangan,
    required String dari,
    required String sampai,
  })  : _dari = dari,
        _sampai = sampai,
        _pegawaiId = pegawaiId,
        _keterangan = keterangan;

  int get pegawaiId => _pegawaiId;

  String get dari => _dari;

  String get sampai => _sampai;

  String get keterangan => _keterangan;
}
