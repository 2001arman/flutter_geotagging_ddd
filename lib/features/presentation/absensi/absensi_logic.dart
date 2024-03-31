import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geotagging/features/application/absensi_app_service.dart';
import 'package:geotagging/features/application/map_app_service.dart';
import 'package:geotagging/features/presentation/absensi/absensi_state.dart';
import 'package:geotagging/utility/shared/utils.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class AbsensiLogic extends GetxController {
  final AbsensiState state = AbsensiState();
  final _app = Get.find<AbsensiAppService>();
  final _mapApp = Get.find<MapAppService>();

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
        return Utils.dialogTidakBisaAbsen(jarak, userPosition);
      } else {
        final res = await _app.absen();
        res.fold(
            (l) => Get.snackbar('Error', l.info),
            (r) => Utils.dialogBisaAbsen(
                  state.dateController.text,
                  state.clockController.text,
                  userPosition,
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
}
