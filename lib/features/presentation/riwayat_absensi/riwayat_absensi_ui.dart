import 'package:flutter/material.dart';
import 'package:geotagging/features/presentation/riwayat_absensi/riwayat_absensi_logic.dart';
import 'package:get/get.dart';

import '../../../utility/shared/constants/constants_ui.dart';
import '../../../utility/shared/widgets/custom_card_absen.dart';
import '../../../utility/shared/widgets/custom_tanggal_absen.dart';

class RiwayatAbsensiUi extends StatelessWidget {
  static const String namePath = '/riwayat_absensi_ui';
  RiwayatAbsensiUi({super.key});
  final logic = Get.find<RiwayatAbsensiLogic>();
  final state = Get.find<RiwayatAbsensiLogic>().state;

  @override
  Widget build(BuildContext context) {
    Widget cardSection() {
      return Container(
        margin: EdgeInsets.only(top: 31, bottom: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCardAbsen(
                title: "Hadir",
                textStyle: greenTextStyle,
                jumlah: state.hadir.value,
              ),
              // CustomCardAbsen(
              //   title: "Tidak Hadir",
              //   textStyle: orangeTextStyle,
              //   jumlah: tidakHadir,
              // ),
              CustomCardAbsen(
                title: "Terlambat",
                textStyle: redTextStyle,
                jumlah: state.terlambat.value,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Riwayat Absensi",
          style: titleTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        iconTheme: IconThemeData(color: kTitleColor),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            cardSection(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Obx(
                () => Column(
                  children: state.riwayatAbsensiList
                      .map(
                        (element) => CustomTanggalAbsen(
                          tanggal: logic.formatedDate(date: element.createdAt!),
                          isTerlambat:
                              logic.isTerlambat(date: element.createdAt!),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // TextButton(
            //   onPressed: () {},
            //   child: Text(
            //     "Tampilkan Lebih Banyak",
            //     style: orangeTextStyle.copyWith(fontWeight: semiBold),
            //   ),
            // ),
            SizedBox(height: defaultMargin),
          ],
        ),
      ),
    );
  }
}
