import 'package:flutter/material.dart';
import 'package:geotagging/features/presentation/absensi/absensi_ui.dart';
import 'package:geotagging/features/presentation/cuti/cuti_ui.dart';
import 'package:geotagging/features/presentation/izin/izin_ui.dart';
import 'package:geotagging/features/presentation/main_page/main_page_logic.dart';
import 'package:geotagging/features/presentation/riwayat_absensi/riwayat_absensi_ui.dart';
import 'package:get/get.dart';

import '../../../utility/shared/constants/constants_ui.dart';
import '../../../utility/shared/widgets/custom_card_button.dart';

class MainPageUi extends StatelessWidget {
  static const String namePath = '/main_page';
   MainPageUi({super.key});
  final logic = Get.find<MainPageLogic>();

  @override
  Widget build(BuildContext context) {
    Widget profileSection() {
      Widget namaSection() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Halo,", style: whiteTextStyle),
            const SizedBox(height: 4),
            Text(
              "nama",
              style: whiteTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4),
            Text('29123931209', style: whiteTextStyle),
            const SizedBox(height: 4),
            Text("Staff IT", style: whiteTextStyle),
          ],
        );
      }

      return Container(
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg-profile.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            namaSection(),
            Container(
              width: 57,
              height: 57,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
                image: const DecorationImage(
                  image: AssetImage("assets/avatar.png"),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget menuSection() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCardButton(
                  title: "Absensi\nKehadiran",
                  imageUrl: "assets/icon_absen.png",
                  onTap: () {
                    Get.toNamed(AbsensiUI.namePath);
                  },
                ),
                CustomCardButton(
                  title: "Pengajuan\nCuti",
                  imageUrl: "assets/icon_cuti.png",
                  onTap: () {
                    Get.toNamed(CutiUi.namePath);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCardButton(
                  title: "Riwayat\nKehadiran",
                  imageUrl: "assets/icon_riwayat.png",
                  onTap: () {
                    Get.toNamed(RiwayatAbsensiUi.namePath);
                  },
                ),
                CustomCardButton(
                  title: "Pengajuan\nIzin",
                  imageUrl: "assets/icon_izin.png",
                  onTap: () {
                    Get.toNamed(IzinUi.namePath);
                  },
                ),
              ],
            ),
            CustomCardButton(
              title: "Logout",
              imageUrl: "assets/icon_logout.png",
              onTap: () {},
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            profileSection(),
            const SizedBox(height: 32),
            menuSection(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
