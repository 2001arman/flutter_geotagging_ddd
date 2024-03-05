import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/constants_ui.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker(
      {Key? key, required this.title, required this.dateinput, this.onChanged})
      : super(key: key);

  final String title;
  final TextEditingController dateinput;
  final Function(String)? onChanged;

  @override
  // ignore: library_private_types_in_public_api
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
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
        SizedBox(
          // margin: EdgeInsets.only(right: 15),
          width: MediaQuery.of(context).size.width / 2.5,
          child: TextField(
            controller: widget.dateinput, //editing controller of this TextField
            decoration: InputDecoration(
              hintText: "Tanggal",
              hintStyle: greyTextStyle.copyWith(fontSize: 13),
              suffixIcon: const Icon(Icons.arrow_forward),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: kGreyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: kOrangeColor),
              ),
            ),
            readOnly:
                true, //set it true, so that user will not able to edit text
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(
                    2000), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101),
              );

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);

                setState(() {
                  widget.dateinput.text =
                      formattedDate; //set output date to TextField value.
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(formattedDate);
                }
              } else {
                Get.log("Date is not selected");
              }
            },
          ),
        ),
      ],
    );
  }
}
