import 'package:flutter/material.dart';
import 'package:geotagging/features/presentation/sign_in/sign_in_logic.dart';
import 'package:geotagging/utility/shared/constants/constants_ui.dart';
import 'package:get/get.dart';

import '../../../utility/shared/widgets/custom_text_form_field.dart';
import '../../../utility/shared/widgets/my_button.dart';

class SignInUi extends StatelessWidget {
  static const String namePath = '/sign_in';
  SignInUi({Key? key}) : super(key: key);
  final logic = Get.find<SignInLogic>();

  @override
  Widget build(BuildContext context) {
    Widget myFormSection() {
      return Column(
        children: [
          CustomTextFormField(
            title: "Email",
            hintText: "Masukkan Email",
            controller: logic.emailController,
            onChanged: logic.onChangeUsername,
          ),
          CustomTextFormField(
            title: "Password",
            hintText: "Masukkan Password",
            controller: logic.passwordController,
            onChanged: logic.onChangePassword,
            isPassword: true,
          ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            SizedBox(height: defaultMargin),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Sign In",
                style: titleTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 64, vertical: defaultMargin),
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
              ),
            ),
            myFormSection(),
            SizedBox(height: defaultMargin),
            Obx(
              () => MyButton(
                onTap: () => logic.signIn(),
                disable: logic.isButtonDisable,
                title: "Login",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
