import 'package:flutter/material.dart';

import '../constants/constants_ui.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {Key? key,
      required this.onTap,
      required this.title,
      this.isOrange = true,
      this.disable = false})
      : super(key: key);
  final VoidCallback onTap;
  final String title;
  final bool isOrange, disable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: disable
              ? kGreyColor
              : isOrange
                  ? kOrangeColor
                  : kWhiteColor,
          borderRadius: BorderRadius.circular(8),
          border: disable
              ? Border.all(color: Colors.transparent)
              : Border.all(color: kOrangeColor),
        ),
        child: Text(
          title,
          style: disable
              ? blackTextStyle.copyWith(fontWeight: semiBold)
              : isOrange
                  ? whiteTextStyle.copyWith(
                      fontWeight: semiBold,
                    )
                  : orangeTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
        ),
      ),
    );
  }
}
