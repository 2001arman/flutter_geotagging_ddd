// To parse this JSON data, do
//
//     final riwayatAbsensiResponse = riwayatAbsensiResponseFromMap(jsonString);

import 'dart:convert';

RiwayatAbsensiResponse riwayatAbsensiResponseFromMap(String str) =>
    RiwayatAbsensiResponse.fromMap(json.decode(str));

String riwayatAbsensiResponseToMap(RiwayatAbsensiResponse data) =>
    json.encode(data.toMap());

class RiwayatAbsensiResponse {
  final int? code;
  final String? status;
  final List<RiwayatAbsensi> data;

  RiwayatAbsensiResponse({
    this.code,
    this.status,
    required this.data,
  });

  factory RiwayatAbsensiResponse.fromMap(Map<String, dynamic> json) =>
      RiwayatAbsensiResponse(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<RiwayatAbsensi>.from(
                json["data"]!.map((x) => RiwayatAbsensi.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class RiwayatAbsensi {
  final int? id;
  final String? idPegawai;
  final String? createdAt;
  final String? updatedAt;

  RiwayatAbsensi({
    this.id,
    this.idPegawai,
    this.createdAt,
    this.updatedAt,
  });

  factory RiwayatAbsensi.fromMap(Map<String, dynamic> json) => RiwayatAbsensi(
        id: json["id"],
        idPegawai: json["id_pegawai"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "id_pegawai": idPegawai,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
