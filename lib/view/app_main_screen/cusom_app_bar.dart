import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      color: whiteColor,
      notchMargin: 12,
      shape: const CircularNotchedRectangle(),
      surfaceTintColor: Colors.transparent,
      padding: EdgeInsets.zero,
      // color: whiteColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () => onTap(0),
              child: Column(
                children: [
                  VerticalSizedBox(vertical: 10.h),
                  Image.asset(
                    cal,
                    height: 25.sp,
                    color: currentIndex == 0 ? baseColor : Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: CustomText(
                      text: "Calender",
                      fontSize: 12,
                      color: currentIndex == 0 ? baseColor : Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
            // IconButton(
            //   icon:

            // ),
            GestureDetector(
              onTap: () => onTap(1),
              child: Column(
                children: [
                  VerticalSizedBox(vertical: 10.h),
                  Image.asset(
                    search,
                    height: 25.sp,
                    color: currentIndex == 1 ? baseColor : Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: CustomText(
                      text: "Events",
                      fontSize: 12,
                      color: currentIndex == 1 ? baseColor : Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),

            HorizontalSizedBox(horizontalSpace: 30.w),
            GestureDetector(
              onTap: () => onTap(2),
              child: Column(
                children: [
                  VerticalSizedBox(vertical: 10.h),
                  Image.asset(
                    friends,
                    height: 25.sp,
                    color: currentIndex == 2 ? baseColor : Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: CustomText(
                      text: "Friends",
                      fontSize: 12,
                      color: currentIndex == 2 ? baseColor : Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),

            GestureDetector(
              onTap: () => onTap(3),
              child: Column(
                children: [
                  VerticalSizedBox(vertical: 10.h),
                  Image.asset(
                    public,
                    height: 25.sp,
                    color: currentIndex == 3 ? baseColor : Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: CustomText(
                      text: "Public",
                      fontSize: 12,
                      color: currentIndex == 3 ? baseColor : Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),

            // The dummy child for spacing
          ],
        ),
      ),
    );
  }
}

class MyNotchedShape extends NotchedShape {
  const MyNotchedShape();

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) return Path()..addRect(host);

    final notchWidth =
        30.0; // Adjust these values to change the size of the notch
    final notchHeight = 20.0;

    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(guest.left - notchWidth, host.top)
      ..lineTo(guest.center.dx, guest.bottom)
      ..lineTo(guest.right + notchWidth, host.top)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}
