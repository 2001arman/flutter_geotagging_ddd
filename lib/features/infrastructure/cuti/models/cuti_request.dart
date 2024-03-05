class CutiRequest {
  CutiRequest({
    required this.idPegawai,
    required this.keterangan,
    required this.dari,
    required this.sampai,
  });
  final int idPegawai;
  final String keterangan;
  final String dari, sampai;

  Map<String, dynamic> toJson() => {
        'id_pegawai': idPegawai,
        'keterangan': keterangan,
        'dari': dari,
        'sampai': sampai,
      };
}
