import 'package:flutter/material.dart';

import '../../../utility/shared/constants/constants_ui.dart';
import '../../../utility/shared/widgets/custom_card_absen.dart';
import '../../../utility/shared/widgets/custom_tanggal_absen.dart';

class RiwayatAbsensiUi extends StatelessWidget {
  static const String namePath = '/riwayat_absensi_ui';
  const RiwayatAbsensiUi({super.key});

  @override
  Widget build(BuildContext context) {
    int hadir = 0, tidakHadir = 0, terlambat = 0;
    Widget cardSection() {
      return Container(
        margin: EdgeInsets.only(top: 31, bottom: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomCardAbsen(
              title: "Hadir",
              textStyle: greenTextStyle,
              jumlah: hadir,
            ),
            CustomCardAbsen(
              title: "Tidak Hadir",
              textStyle: orangeTextStyle,
              jumlah: tidakHadir,
            ),
            CustomCardAbsen(
              title: "Terlambat",
              textStyle: redTextStyle,
              jumlah: terlambat,
            ),
          ],
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
              child: const Column(
                children: [
                  CustomTanggalAbsen(
                    tanggal: "Minggu, 30 September (07:10:30)",
                    isTidakHadir: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text(
                "Tampilkan Lebih Banyak",
                style: orangeTextStyle.copyWith(fontWeight: semiBold),
              ),
            ),
            SizedBox(height: defaultMargin),
          ],
        ),
      ),
    );
  }
}
