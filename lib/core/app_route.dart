import 'package:geotagging/features/presentation/absensi/absensi_binding.dart';
import 'package:geotagging/features/presentation/absensi/absensi_ui.dart';
import 'package:geotagging/features/presentation/cuti/cuti_binding.dart';
import 'package:geotagging/features/presentation/cuti/cuti_ui.dart';
import 'package:geotagging/features/presentation/izin/izin_binding.dart';
import 'package:geotagging/features/presentation/izin/izin_ui.dart';
import 'package:geotagging/features/presentation/main_page/main_page_binding.dart';
import 'package:geotagging/features/presentation/main_page/main_page_ui.dart';
import 'package:geotagging/features/presentation/riwayat_absensi/riwayat_absensi_binding.dart';
import 'package:geotagging/features/presentation/riwayat_absensi/riwayat_absensi_ui.dart';
import 'package:geotagging/features/presentation/sign_in/sign_in_binding.dart';
import 'package:geotagging/features/presentation/sign_in/sign_in_ui.dart';
import 'package:geotagging/features/presentation/splash_screen/splash_screen_ui.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../features/presentation/splash_screen/splash_screen_binding.dart';

class AppRoute {
  static const initialRoute = SplashScreenUi.namePath;
  static final routes = [
    GetPage(
      name: SplashScreenUi.namePath,
      page: () => SplashScreenUi(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: MainPageUi.namePath,
      page: () => MainPageUi(),
      binding: MainPageBinding(),
    ),
    GetPage(
      name: SignInUi.namePath,
      page: () => SignInUi(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AbsensiUI.namePath,
      page: () => AbsensiUI(),
      binding: AbsensiBinding(),
    ),
    GetPage(
      name: CutiUi.namePath,
      page: () => const CutiUi(),
      binding: CutiBinding(),
    ),
    GetPage(
      name: IzinUi.namePath,
      page: () => const IzinUi(),
      binding: IzinBinding(),
    ),
    GetPage(
      name: RiwayatAbsensiUi.namePath,
      page: () => const RiwayatAbsensiUi(),
      binding: RiwayatAbsensiBinding(),
    ),
  ];
}
