import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Core/constant/colors.dart';

class Utils {
  //
  /// This method is used to get the average rating of the product or what you want;
  /// [rating] is the list of the rating of the product;
  static double averageRating(List<int> rating) {
    var avgRating = 0;
    for (int i = 0; i < rating.length; i++) {
      avgRating = avgRating + rating[i];
    }
    return double.parse((avgRating / rating.length).toStringAsFixed(1));
  }

  //
  /// This method is used to change the focus of the field;
  /// [context] is the context of the screen;
  /// [current] is the current focus node;
  /// [nextFocus] is the next focus node;
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //
  /// Or add more methods here;
  /// ...
  static void flushbarMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.bounceIn,
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(5.r),
        margin: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        padding: EdgeInsets.all(15.sp),
        message: message,
        duration: const Duration(seconds: 3),
        backgroundColor: redColor,
        reverseAnimationCurve: Curves.easeOut,
        icon: const Icon(
          Icons.error_outline,
          color: whiteColor,
        ),
      )..show(context),
    );
  }

  static void successflushbarMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.bounceIn,
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(5.r),
        margin: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        padding: EdgeInsets.all(15.sp),
        message: message,
        duration: const Duration(seconds: 3),
        backgroundColor: greenColor,
        reverseAnimationCurve: Curves.easeOut,
        icon: const Icon(
          Icons.done_outline_rounded,
          color: whiteColor,
        ),
      )..show(context),
    );
  }
}
