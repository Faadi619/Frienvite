import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool shadow;
  final Color? backgroundColor;
  final Color? borderColor;
  final String? imageUrl;
  final String? title;
  final String? address;
  final Widget? child;

  const CustomContainer({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.shadow = false,
    this.backgroundColor,
    this.borderColor,
    this.imageUrl,
    this.title,
    this.address,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        boxShadow: shadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ]
            : [],
      ),
      child: child,
    );
  }
}
