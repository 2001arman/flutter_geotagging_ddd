import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utility/shared/constants/constants_ui.dart';
import '../../../utility/shared/widgets/custom_date_picker.dart';
import '../../../utility/shared/widgets/custom_text_form_field.dart';
import '../../../utility/shared/widgets/my_button.dart';

class CutiUi extends StatelessWidget {
  static String namePath = '/cuti_page';
  const CutiUi({super.key});

  @override
  Widget build(BuildContext context) {
    Widget myFormSection() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            CustomTextFormField(
              controller: TextEditingController(),
              hintText: "Masukkan Nama",
              title: "Nama",
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              hintText: "Masukkan NIP",
              title: "NIP",
            ),
            CustomTextFormField(
              controller: TextEditingController(),
              hintText: "Masukkan Keterangan",
              title: "Keterangan",
              minLines: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDatePicker(
                    title: "Mulai Dari", dateinput: TextEditingController()),
                CustomDatePicker(
                    title: "Sampai", dateinput: TextEditingController()),
              ],
            ),
            SizedBox(height: defaultMargin),
            MyButton(
              onTap: () {},
              title: "Submit",
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
