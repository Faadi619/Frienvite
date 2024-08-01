import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:frienivite_app/Core/Components/app_button.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';
import 'package:frienivite_app/view/loginoption/language_carousol.dart';
import 'package:frienivite_app/view/loginoption/login_option_provider.dart';
import 'package:provider/provider.dart';

class LoginOptionScreen extends StatefulWidget {
  const LoginOptionScreen({super.key});

  @override
  State<LoginOptionScreen> createState() => _LoginOptionScreenState();
}

class _LoginOptionScreenState extends State<LoginOptionScreen> {
  int _selectedIndex = 0;
  bool showPass = false;
  bool android = true;
  List<String> texts = [
    "GER",
    "ARA",
    "ENG",
    "FRA",
    "SPA",
  ];

  @override
  Widget build(BuildContext context) {
    final loginMethodProvider = Provider.of<LoginMethodProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              VerticalSizedBox(vertical: 15.h),
              LanguageCarousel(),
              VerticalSizedBox(vertical: 15.h),
              Image.asset(
                logo2,
                height: 220.h,
                width: 210.w,
              ),
              VerticalSizedBox(vertical: 10.h),
              CustomText(
                text: "Welcome!",
                fontSize: 28.sp,
                color: blackColor,
                fontWeight: FontWeight.w600,
              ),
              VerticalSizedBox(vertical: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomButton(
                  title: "Continue With Email",
                  icon: Icons.email_outlined,
                  onPressed: () {
                    loginMethodProvider.setLoginMethod("email");
                    Navigator.pushNamed(context, RoutesName.signIn);
                  },
                ),
              ),
              VerticalSizedBox(vertical: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomButton(
                  title: "Continue With Phone No.",
                  icon: Icons.phone_android_outlined,
                  onPressed: () {
                    loginMethodProvider.setLoginMethod("phone");
                    Navigator.pushNamed(context, RoutesName.signIn);
                  },
                ),
              ),
              VerticalSizedBox(vertical: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Don't have an account? ",
                    fontSize: 14.sp,
                    color: blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.loginoption2);
                    },
                    child: CustomText(
                      text: "Sign up",
                      fontSize: 14.sp,
                      color: baseColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum LoginMethod {
  phone,
  email,
}
