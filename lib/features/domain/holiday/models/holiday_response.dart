// To parse this JSON data, do
//
//     final holidayResponse = holidayResponseFromMap(jsonString);

import 'dart:convert';

HolidayResponse holidayResponseFromMap(String str) =>
    HolidayResponse.fromMap(json.decode(str));

String holidayResponseToMap(HolidayResponse data) => json.encode(data.toMap());

class HolidayResponse {
  final int code;
  final String status;
  final List<HolidayModel> data;

  HolidayResponse({
    required this.code,
    required this.status,
    required this.data,
  });

  factory HolidayResponse.fromMap(Map<String, dynamic> json) => HolidayResponse(
        code: json["code"],
        status: json["status"],
        data: List<HolidayModel>.from(
            json["data"].map((x) => HolidayModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class HolidayModel {
  final int id;
  final DateTime tanggal;
  final String nama;

  HolidayModel({
    required this.id,
    required this.tanggal,
    required this.nama,
  });

  factory HolidayModel.fromMap(Map<String, dynamic> json) => HolidayModel(
        id: json["id"],
        tanggal: DateTime.parse(json["tanggal"]),
        nama: json["nama"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "nama": nama,
      };
}
