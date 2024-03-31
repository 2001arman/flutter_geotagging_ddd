import 'package:geotagging/features/domain/absensi/models/riwayat_absensi_response.dart';
import 'package:get/get.dart';

class RiwayatAbsensiState {
  var riwayatAbsensiList = <RiwayatAbsensi>[].obs;
  var hadir = 0.obs;
  var terlambat = 0.obs;
}
