import 'package:flutter/material.dart';
import 'package:geotagging/features/presentation/izin/izin_logic.dart';
import 'package:get/get.dart';

import '../../../utility/shared/constants/constants_ui.dart';
import '../../../utility/shared/widgets/custom_text_form_field.dart';
import '../../../utility/shared/widgets/my_button.dart';

class IzinUi extends StatelessWidget {
  static const String namePath = '/izin_page';
  IzinUi({super.key});
  final logic = Get.find<IzinLogic>();
  final state = Get.find<IzinLogic>().state;

  @override
  Widget build(BuildContext context) {
    Widget formSection() {
      return Column(
        children: [
          SizedBox(height: defaultMargin),
          for (var item in state.radioValue)
            Obx(
              () => GestureDetector(
                onTap: () => logic.onChangeRadio(item),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: item,
                      groupValue: state.groupValue.value,
                      onChanged: logic.onChangeRadio,
                      activeColor: kOrangeColor,
                    ),
                    Text(
                      item,
                      style: blackTextStyle,
                    ),
                  ],
                ),
              ),
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
            onTap: () => Get.back(),
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
