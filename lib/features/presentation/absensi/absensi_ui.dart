import 'package:flutter/material.dart';
import 'package:geotagging/features/presentation/absensi/absensi_logic.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../utility/shared/constants/constants_ui.dart';
import '../../../utility/shared/widgets/custom_date_form_field.dart';
import '../../../utility/shared/widgets/my_button.dart';

class AbsensiUI extends StatelessWidget {
  static const String namePath = '/absensi_page';
  final logic = Get.find<AbsensiLogic>();
  final state = Get.find<AbsensiLogic>().state;
  AbsensiUI({super.key});

  @override
  Widget build(BuildContext context) {
    Widget mapSection() {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.465,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kGreenBGColor,
        ),
        child: GoogleMap(
          initialCameraPosition:
              state.posisiAbsen, // map langsung ngarah ke uniba
          mapType: MapType.normal, // tipe mapnya normal
          circles: logic.getCircleRadius(), // radius
          myLocationEnabled: true, // lokasi user
          myLocationButtonEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            state.mapsController.complete(controller);
          },
        ),
      );
    }

    Widget lokasiSection() {
      return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.2,
        maxChildSize: 0.8,
        expand: true,
        builder: (BuildContext context, ScrollController controller) {
          return Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: ListView(
              children: [
                SizedBox(height: defaultMargin),
                Text(
                  "Lokasi Anda",
                  style: titleTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 16),
                CustomDateFormField(
                  title: "Date",
                  image: "assets/icon_cuti.png",
                  controller: state.dateController,
                ),
                CustomDateFormField(
                  title: "O'Clock",
                  image: "assets/icon_jam.png",
                  controller: state.clockController,
                ),
                SizedBox(height: defaultMargin),
                MyButton(
                  onTap: () {
                    bool jam = logic.ceckJamHari();
                    if (jam) {
                      logic.cekJarak();
                    }
                  },
                  title: "Submit",
                ),
                SizedBox(height: defaultMargin),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: kTitleColor),
        title: Text(
          "Presensi Kehadiran",
          style: titleTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          mapSection(),
          lokasiSection(),
        ],
      ),
    );
  }
}
