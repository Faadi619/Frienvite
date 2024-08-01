import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/constant/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  IconData? icon;

  CustomButton({
    super.key,
    this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 3.h, bottom: 3.h), // Adjust margin as needed
      decoration: BoxDecoration(
        color: baseColor, // Background color of the button
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 14.0,
            spreadRadius: 0,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius:
            BorderRadius.circular(14.r), // Match the container's border radius
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: whiteColor,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  icon as IconData?,
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
