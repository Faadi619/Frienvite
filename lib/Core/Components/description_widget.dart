import 'package:flutter/material.dart';

class CustomDescriptionField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final Color? borderColor;
  final double borderRadius;
  final TextEditingController? controller;
  final int maxLines;

  const CustomDescriptionField({
    super.key,
    this.title,
    this.hintText,
    this.borderColor,
    this.borderRadius = 8.0,
    this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: borderColor ?? Colors.black,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
