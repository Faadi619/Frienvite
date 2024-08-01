import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/colors.dart';

class CustomTextField1 extends StatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  const CustomTextField1({
    Key? key,
    this.title,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.textInputAction,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: CustomText(
              text: title!,
              fontSize: 15.sp,
              color: greyColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          textInputAction: textInputAction,
          focusNode: focusNode,
          cursorColor: baseColor,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
                // color: blackColor,
                // fontWeight: FontWeight.w600,
                ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.sp,
            ),
            isDense: true,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: greyColor.withOpacity(0.5)),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: greyColor.withOpacity(0.5)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: greyColor.withOpacity(0.5)),
            ),
          ),
        ),
      ],
    );
  }
}
