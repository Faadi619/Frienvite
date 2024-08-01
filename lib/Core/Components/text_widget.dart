import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  bool underline;

  CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.underline = false,
    required this.fontWeight,
    this.textOverflow,
    this.maxLines,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: fontSize,
        decoration:
            underline == true ? TextDecoration.underline : TextDecoration.none,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
