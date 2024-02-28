import 'package:flutter/material.dart';
import 'package:geotagging/features/presentation/splash_screen/splash_screen_logic.dart';
import 'package:get/get.dart';

class SplashScreenUi extends StatelessWidget {
  static const String namePath = '/splash';
  final logic = Get.find<SplashScreenLogic>();
  SplashScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 206,
          height: 206,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo.png"),
            ),
          ),
        ),
      ),
    );
  }
}
