class IzinEntities {
  final String _alasan;
  final String _keterangan;

  IzinEntities({
    required String alasan,
    required String keterangan,
  })  : _alasan = alasan,
        _keterangan = keterangan;

  String get alasan => _alasan;

  String get keterangan => _keterangan;
}
