import 'package:flutter/material.dart';

import '../../../utility/shared/constants/constants_ui.dart';
import '../../../utility/shared/widgets/custom_text_form_field.dart';
import '../../../utility/shared/widgets/my_button.dart';

class IzinUi extends StatelessWidget {
  static const String namePath = '/izin_page';
  const IzinUi({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> radioValue = ["izin", "sakit", "cuti"];
    Widget formSection() {
      return Column(
        children: [
          SizedBox(height: defaultMargin),
          for (var item in radioValue)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: item,
                  groupValue: '',
                  onChanged: (val) {},
                  activeColor: kOrangeColor,
                ),
                Text(
                  item,
                  style: blackTextStyle,
                ),
              ],
            ),
          const SizedBox(height: 16),
          CustomTextFormField(
            controller: TextEditingController(),
            hintText: "Masukkan Keterangan",
            title: "Keterangan Lain",
            minLines: 3,
          ),
          SizedBox(height: defaultMargin),
          MyButton(
            onTap: () {},
            title: "Submit",
          ),
          const SizedBox(height: 12),
          MyButton(
            onTap: () {
              Navigator.pop(context);
            },
            title: "Cancel",
            isOrange: false,
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pengajuan Izin",
          style: titleTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
        backgroundColor: kWhiteColor,
        elevation: 0,
        iconTheme: IconThemeData(color: kTitleColor),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              SizedBox(height: defaultMargin),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Silahkan pilih alasan izin",
                  style: blackTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              formSection(),
            ],
          ),
        ),
      ),
    );
  }
}
