class AbsensiRequest {
  AbsensiRequest({
    required this.idPegawai,
  });
  final int idPegawai;

  Map<String, dynamic> toJson() => {
        'id_pegawai': idPegawai,
      };
}
