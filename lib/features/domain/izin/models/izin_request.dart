class IzinRequest {
  IzinRequest({
    required this.idPegawai,
    required this.alasan,
    required this.keterangan,
  });
  final int idPegawai;
  final String alasan;
  final String keterangan;

  Map<String, dynamic> toJson() => {
        'id_pegawai': idPegawai,
        'alasan': alasan,
        'keterangan': keterangan,
      };
}
