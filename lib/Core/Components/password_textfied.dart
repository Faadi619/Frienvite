import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/colors.dart';

class CustomPasswordTextField extends StatefulWidget {
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

  const CustomPasswordTextField({
    super.key,
    this.title,
    this.controller,
    this.hintText,
    this.obscureText = true,
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
    this.maxLength,
    this.maxLines = 1,
    this.minLines = 1,
    this.onTap,
  });

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              text: widget.title!,
              fontSize: 14.sp,
              color: blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
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
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      visibility = !visibility;
                    });
                  },
                  child: Icon(
                    visibility == false
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: blackColor,
                  ),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: widget.prefixicon ?? const SizedBox(),
                ),
                contentPadding: EdgeInsets.only(top: 11.h),
                isDense: widget.isDense,
                filled: widget.filled,
                fillColor: widget.fillColor,
                border: InputBorder.none,
              ),
              obscureText: !visibility,
              keyboardType: widget.keyboardType,
              enabled: widget.enabled,
              autofocus: widget.autoFocus,
              readOnly: widget.readOnly,
              autocorrect: widget.autocorrect,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              style: widget.textStyle,
              maxLength: widget.maxLength,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              onTap: widget.onTap,
            ),
          ),
        ),
      ],
    );
  }
}
