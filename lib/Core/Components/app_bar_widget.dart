import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';
import 'package:frienivite_app/view/Profile/profile_screen.dart';
import 'package:frienivite_app/view/groups/Groups_Screen.dart';
import 'package:frienivite_app/view/notification_screen/notification_screen.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatelessWidget {
  String title;

  AppBarWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 25.sp,
            color: baseColor,
          ),
        ),
        CustomText(
          text: title,
          fontSize: 24.sp,
          color: blackColor,
          fontWeight: FontWeight.bold,
        ),
        Icon(
          Icons.arrow_back_ios,
          size: 25.sp,
          color: Colors.transparent,
        ),
      ],
    );
  }
}

//app bar 2
// ignore: must_be_immutable
class AppBarWidget3 extends StatelessWidget {
  Color? color;
  AppBarWidget3({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.h,
      color: color ?? Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        FadePageRoute(
                          page: const ProfileScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      p1,
                      height: 40.h,
                      width: 40.w,
                    )),
                Image.asset(
                  logo,
                  width: 140.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      FadePageRoute(
                        page: NotificationScreen(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.notifications,
                    size: 30.sp,
                    color: baseColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//appbar 3
// app bar 2
// ignore: must_be_immutable
class AppBarWidget2 extends StatelessWidget {
  Color? color;
  AppBarWidget2({
    super.key,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.h,
      color: color ?? Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        FadePageRoute(
                          page: const ProfileScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      p1,
                      height: 40.h,
                      width: 40.w,
                    )),
                Image.asset(
                  logo,
                  width: 140.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.groupsScreen);
                  },
                  child: Icon(
                    Icons.groups,
                    size: 30.sp,
                    color: baseColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
