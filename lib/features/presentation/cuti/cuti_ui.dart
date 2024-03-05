import 'package:flutter/material.dart';
import 'package:geotagging/features/presentation/cuti/cuti_logic.dart';
import 'package:get/get.dart';

import '../../../utility/shared/constants/constants_ui.dart';
import '../../../utility/shared/widgets/custom_date_picker.dart';
import '../../../utility/shared/widgets/custom_text_form_field.dart';
import '../../../utility/shared/widgets/my_button.dart';

class CutiUi extends StatelessWidget {
  static String namePath = '/cuti_page';
  CutiUi({super.key});
  final logic = Get.find<CutiLogic>();
  final state = Get.find<CutiLogic>().state;

  @override
  Widget build(BuildContext context) {
    Widget myFormSection() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            CustomTextFormField(
              controller: state.namaController,
              hintText: "Masukkan Nama",
              title: "Nama",
              isReadOnly: true,
            ),
            CustomTextFormField(
              controller: state.nipController,
              hintText: "Masukkan NIP",
              title: "NIP",
              isReadOnly: true,
            ),
            CustomTextFormField(
              controller: state.keteranganController,
              hintText: "Masukkan Keterangan",
              title: "Keterangan",
              minLines: 5,
              onChanged: logic.setKeterangan,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDatePicker(
                  title: "Mulai Dari",
                  dateinput: state.mulaiDariController,
                  onChanged: logic.setMulaiDari,
                ),
                CustomDatePicker(
                  title: "Sampai",
                  dateinput: state.sampaiController,
                  onChanged: logic.setSampai,
                ),
              ],
            ),
            SizedBox(height: defaultMargin),
            Obx(
              () => MyButton(
                onTap: logic.submitCuti,
                title: "Submit",
                disable: logic.isButtonDisable,
              ),
            ),
            const SizedBox(height: 12),
            MyButton(
              onTap: () {
                Get.back();
              },
              title: "Cancel",
              isOrange: false,
            ),
            SizedBox(height: defaultMargin),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: kTitleColor),
        title: Text(
          "Pengajuan Cuti",
          style: titleTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: defaultMargin),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 88),
              child: Text(
                "Silahkan isi data diri anda beserta alasan cuti",
                style: blackTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            myFormSection(),
          ],
        ),
      ),
    );
  }
}
