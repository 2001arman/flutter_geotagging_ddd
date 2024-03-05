import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'constants/constants_ui.dart';
import 'widgets/my_button.dart';

class Utils {
  static Future<dynamic> dialogTidakBisaAbsen(double jarak, LatLng location) {
    int jarakRound = jarak.round();
    return Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFFFFEDED),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.symmetric(horizontal: 17),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                width: 50,
                height: 50,
                // margin: EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icon_failed.png"),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Tidak Bisa Absen",
                style: dialogRedTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Anda diluar radius absen",
                style: dialogRedTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Jarak anda : $jarakRound m",
                style: dialogRedTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10),
              Text(
                "Lokasi : ${location.latitude}, ${location.longitude}",
                style: dialogRedTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 50),
              MyButton(
                onTap: () {
                  Get.back();
                },
                title: "Lanjutkan",
              ),
              const SizedBox(height: 30),
            ],
          )
        ],
      ),
    );
  }

  static Future<dynamic> dialogBisaAbsen(
      String tanggal, String jam, LatLng location) {
    return Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFFEFFFEC),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.symmetric(horizontal: 17),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                width: 50,
                height: 50,
                // margin: EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icon_done.png"),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Berhasil Absen",
                style: dialogGreenTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tanggal : ",
                    style: dialogGreenTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      tanggal,
                      style: dialogGreenTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Jam       : $jam WITA",
                  style: dialogGreenTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Lokasi   : ${location.latitude}, ${location.longitude}",
                  style: dialogGreenTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 50),
              MyButton(
                onTap: () {
                  Get.back();
                },
                title: "Lanjutkan",
              ),
              const SizedBox(height: 30),
            ],
          )
        ],
      ),
    );
  }

  static Future<dynamic> dialogPermissionRequest() {
    return Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFFFFEDED),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: const EdgeInsets.symmetric(horizontal: 17),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icon_failed.png"),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Izin Lokasi Dibutuhkan",
                style: dialogRedTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                "Untuk menggunakan fitur ini, izinkan akses ke lokasi Anda. Aktifkan izin lokasi sekarang untuk melanjutkan.",
                style: dialogRedTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              MyButton(
                onTap: () async {
                  await AppSettings.openAppSettings(
                      type: AppSettingsType.location);
                },
                title: "Pengaturan",
              ),
              const SizedBox(height: 30),
            ],
          )
        ],
      ),
    );
  }
}
