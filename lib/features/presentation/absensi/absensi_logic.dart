import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geotagging/features/application/absensi_app_service.dart';
import 'package:geotagging/features/application/map_app_service.dart';
import 'package:geotagging/features/domain/holiday/models/holiday_response.dart';
import 'package:geotagging/features/presentation/absensi/absensi_state.dart';
import 'package:geotagging/utility/shared/utils.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utility/shared/constants/storage_constants.dart';

class AbsensiLogic extends GetxController {
  final AbsensiState state = AbsensiState();
  final _app = Get.find<AbsensiAppService>();
  final _mapApp = Get.find<MapAppService>();
  final preference = Get.find<SharedPreferences>();

  // fungsi menggambar radius 100m
  Set<Circle> getCircleRadius() {
    return {
      Circle(
        circleId: const CircleId("informatika"),
        center: state.latLong,
        radius: 100,
        fillColor: const Color(0xFF1766FF).withOpacity(0.3),
        strokeColor: const Color(0xFF1766FF),
        strokeWidth: 1,
      )
    };
  }

  @override
  void onInit() {
    getDateData();
    super.onInit();
  }

  void getDateData() {
    initializeDateFormatting();
    DateTime now = DateTime.now();
    String jam = DateFormat('HH:mm:ss').format(now);
    String tanggal =
        DateFormat("EEEE, d MMMM yyyy", "id_ID").format(DateTime.now());
    state.dateController.text = tanggal;
    state.clockController.text = jam;
  }

  void cekJarak() async {
    if (await Permission.location.isGranted) {
      EasyLoading.show();
      LatLng userPosition = await _app.getUserPosition();
      double jarak = _mapApp.distanceBetween(
          state.latLong.latitude,
          state.latLong.longitude,
          userPosition.latitude,
          userPosition.longitude);
      Get.log('=== jaraknya berapa lur $jarak');
      if (jarak > 100) {
        Utils.dialogTidakBisaAbsen(jarak, userPosition);
      } else {
        final res = await _app.absen();
        res.fold(
            (l) => Get.snackbar('Error', l.info),
            (r) => Utils.dialogBisaAbsen(
                  state.dateController.text,
                  state.clockController.text,
                  userPosition,
                  jarak,
                ));
      }
      EasyLoading.dismiss();
    } else if (await Permission.location.isDenied) {
      await Permission.location.request();
      return;
    } else if (await Permission.location.isPermanentlyDenied) {
      Utils.dialogPermissionRequest();
      return;
    }
  }

  bool ceckJamHari() {
    DateTime now = DateTime.now();
    String holiday = preference.getString(StorageConstants.holiday)!;

    final holidayModel = List<HolidayModel>.from(
        jsonDecode(holiday).map((x) => HolidayModel.fromMap(x)));

    // cek apakah sekarang hari libur nasional
    for (var holiday in holidayModel) {
      if (holiday.tanggal.day == now.day &&
          holiday.tanggal.month == now.month) {
        Utils.dialogTidakBisaAbsenHari(
            'Maaf absensi tidak bisa dilakukan pada hari libur nasional. Hari ini adalah ${holiday.nama}');
        return false;
      }
    }

    // cek apakah saat ini adalah hari kerja senin - jumat
    if (now.weekday != DateTime.sunday && now.weekday != DateTime.saturday) {
      // cek apakah saat ini adalah jam kerja 07:00 - 17:00
      if (now.hour >= 7 && now.hour < 17) {
        return true;
      } else {
        Utils.dialogTidakBisaAbsenHari(
            'Maaf absensi hanya bisa dilakukan pada jam 07:00 - 17:00 WITA');
        return false;
      }
    } else {
      Utils.dialogTidakBisaAbsenHari(
          'Maaf absensi hanya bisa dilakukan pada hari kerja Senin - Jumat');
      return false;
    }
  }
}
