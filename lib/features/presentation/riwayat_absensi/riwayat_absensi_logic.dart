import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geotagging/features/presentation/riwayat_absensi/riwayat_absensi_state.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../application/absensi_app_service.dart';

class RiwayatAbsensiLogic extends GetxController {
  final RiwayatAbsensiState state = RiwayatAbsensiState();
  final _app = Get.find<AbsensiAppService>();
  @override
  void onInit() async {
    await getDataRiwayat();
    hitungTotalHadir();
    super.onInit();
  }

  String formatedDate({required String date}) {
    final dateTime = DateTime.parse(date);
    return DateFormat('EEEE, d MMMM (HH:mm:ss)').format(dateTime);
  }

  Future<void> getDataRiwayat() async {
    EasyLoading.show();
    final res = await _app.riwayatAbsensi();

    res.fold(
      (l) => Get.snackbar('Error', l.info),
      (r) => state.riwayatAbsensiList.addAll(r.data),
    );
    EasyLoading.dismiss();
  }

  bool isTerlambat({required String date}) {
    final dateTime = DateTime.parse(date);
    if (dateTime.hour > 8) {
      return true;
    }
    return false;
  }

  void hitungTotalHadir() {
    for (var data in state.riwayatAbsensiList) {
      final dateTime = DateTime.parse(data.createdAt!);
      if (dateTime.hour > 8) {
        state.terlambat++;
      } else {
        state.hadir++;
      }
    }
  }
}
