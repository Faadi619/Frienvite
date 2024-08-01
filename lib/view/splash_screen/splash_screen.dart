import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/view/loginoption/login_option.dart';
import 'package:frienivite_app/view/sign_in_screen.dart/sign_in_screen.dart';
import 'package:get/route_manager.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> init() async {
    print("oooooooo........................");
    // var splashscreenProvider =
    //     Provider.of<SplashViewModel>(context, listen: false);

    // bool check = await splashscreenProvider.checkOnboardingShown();
    // print(check);
    Timer(
      const Duration(seconds: 1),
      () => Get.to(() => const LoginOptionScreen()),
    );
    // if (check) {
    //   print("oooooooo........................2");
    //   Timer(
    //     Duration(seconds: 1),
    //     () {
    //       //
    //       // Get.to(() => LoginScreen());

    //       splashscreenProvider.isUserLoggedIn();
    //     },
    //   );
    // } else {
    //   Timer(
    //     Duration(seconds: 2),
    //     () => Get.to(() => MainOnboardingScreen()),
    //   );
    // }
  }

  void initState() {
    init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 90.h),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Just for alignement
              NutsActivityIndicator(
                animating: false,
                tickCount: 12,
                activeColor: Colors.transparent,
                inactiveColor: Colors.transparent,
                endRatio: 0.6,
                radius: 26.r,
                startRatio: 1,
              ),
              const Spacer(),
              // ^^Just for alignement^^
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    logo2,
                    width: 200.w,
                    height: 200.h,
                  )
                ],
              ),
              VerticalSizedBox(vertical: 20.h),
              // VerticalSizedBox(vertical: 20.h),
              CustomText(
                text: "Welcome to",
                fontSize: 27.sp,
                color: blackColor,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                text: "FRIENVITE",
                fontSize: 27.sp,
                color: blackColor,
                fontWeight: FontWeight.w500,
              ),
              VerticalSizedBox(vertical: 20.h),
              const Spacer(),
              NutsActivityIndicator(
                animating: true,
                tickCount: 12,
                activeColor: baseColor,
                inactiveColor: Colors.transparent,
                endRatio: 0.6,
                radius: 26.r,
                startRatio: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
