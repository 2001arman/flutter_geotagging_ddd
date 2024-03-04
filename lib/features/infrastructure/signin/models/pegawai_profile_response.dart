// To parse this JSON data, do
//
//     final pegawaiProfileResponse = pegawaiProfileResponseFromMap(jsonString);

import 'dart:convert';

import 'package:geotagging/features/infrastructure/signin/models/pegawai_profile.dart';

PegawaiProfileResponse pegawaiProfileResponseFromMap(String str) =>
    PegawaiProfileResponse.fromMap(json.decode(str));

String pegawaiProfileResponseToMap(PegawaiProfileResponse data) =>
    json.encode(data.toMap());

class PegawaiProfileResponse {
  final int? code;
  final String? status;
  final String? message;
  final PegawaiProfile? pegawai;

  PegawaiProfileResponse({
    this.code,
    this.status,
    this.message,
    this.pegawai,
  });

  factory PegawaiProfileResponse.fromMap(Map<String, dynamic> json) =>
      PegawaiProfileResponse(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        pegawai: json["pegawai"] == null
            ? null
            : PegawaiProfile.fromMap(json["pegawai"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "message": message,
        "pegawai": pegawai?.toMap(),
      };
}
