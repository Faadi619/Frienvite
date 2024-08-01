import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/colors.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool enabled;
  final Widget? suffixIcon;
  final Widget? prefixicon;
  final bool autoFocus;
  final bool readOnly;
  final bool autocorrect;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? titleStyle;
  final TextStyle? textStyle;
  final bool isDense;
  final bool filled;
  final Color? fillColor;
  final bool enabledBorder;
  final bool focusedBorder;
  final bool border;
  final bool errorBorder;
  final bool disabledBorder;
  final bool focusedErrorBorder;
  final bool counter;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final Function()? onTap;

  const CustomTextField({
    super.key,
    this.title,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.enabled = true,
    this.suffixIcon,
    this.autoFocus = false,
    this.readOnly = false,
    this.autocorrect = true,
    this.onChanged,
    this.onSubmitted,
    this.contentPadding,
    this.titleStyle,
    this.textStyle,
    this.isDense = false,
    this.prefixicon,
    this.filled = false,
    this.fillColor,
    this.enabledBorder = true,
    this.focusedBorder = true,
    this.border = true,
    this.errorBorder = true,
    this.disabledBorder = true,
    this.focusedErrorBorder = true,
    this.counter = false,
    this.maxLength = 2,
    this.maxLines = 1,
    this.minLines = 1,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: title!,
                  fontSize: 14.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                ),
              )
            : const SizedBox(),
        Container(
          height: 60.h,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: [
              BoxShadow(
                color: blackColor.withOpacity(0.25),
                blurRadius: 24.0,
                spreadRadius: 2.0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: TextField(
              cursorColor: baseColor,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: suffixIcon,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: prefixicon ?? const SizedBox(),
                ),
                contentPadding: EdgeInsets.only(top: 12.h),
                isDense: isDense,
                filled: filled,
                fillColor: fillColor,
                border: InputBorder.none,
              ),
              obscureText: obscureText,
              keyboardType: keyboardType,
              enabled: enabled,
              autofocus: autoFocus,
              readOnly: readOnly,
              autocorrect: autocorrect,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              onTap: onTap,
              style: textStyle,
            ),
          ),
        ),
      ],
    );
  }
}
