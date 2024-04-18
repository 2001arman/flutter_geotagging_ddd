import 'package:flutter/material.dart';

import '../constants/constants_ui.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    required this.title,
    this.minLines = 1,
    required this.controller,
    this.onChanged,
    this.isReadOnly = false,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  final String hintText, title;
  final bool isPassword, isReadOnly;
  final int minLines;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final TextInputType textInputType;

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: semiBold,
          ),
        ),
        const SizedBox(height: 10),
        widget.isPassword
            ? TextFormField(
                controller: widget.controller,
                obscureText: obscure,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      if (obscure == false) {
                        obscure = true;
                      } else {
                        obscure = false;
                      }
                      setState(() {});
                    },
                    child: obscure
                        ? Icon(Icons.visibility_off, color: kBlackColor)
                        : Icon(Icons.visibility, color: kBlackColor),
                  ),
                  hintStyle: greyTextStyle.copyWith(fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: kGreyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: kOrangeColor),
                  ),
                ),
              )
            : TextFormField(
                controller: widget.controller,
                obscureText: widget.isPassword,
                readOnly: widget.isReadOnly,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: greyTextStyle.copyWith(fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: kGreyColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: kOrangeColor),
                  ),
                ),
                maxLines: widget.minLines,
                keyboardType: widget.textInputType,
              ),
        const SizedBox(height: 12),
      ],
    );
  }
}
