import 'package:flutter/material.dart';
import 'package:geotagging/utility/shared/constants/constants_ui.dart';

class CustomCardButton extends StatelessWidget {
  const CustomCardButton(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.onTap})
      : super(key: key);

  final String imageUrl, title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.width / 2.5,
        width: MediaQuery.of(context).size.width / 2.5,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 16),
              color: const Color(0xFF7090B0).withOpacity(0.15),
              blurRadius: 40,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
