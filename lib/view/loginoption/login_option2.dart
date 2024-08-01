import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frienivite_app/Core/Components/app_button.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/password_textfied.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/Components/textfield_container.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';
import 'package:frienivite_app/view/loginoption/language_carousol.dart';
import 'package:frienivite_app/view/loginoption/login_option_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wheel_slider/wheel_slider.dart';

class LoginOptionScreen2 extends StatefulWidget {
  const LoginOptionScreen2({super.key});

  @override
  State<LoginOptionScreen2> createState() => _LoginOptionScreen2State();
}

class _LoginOptionScreen2State extends State<LoginOptionScreen2> {
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
              VerticalSizedBox(vertical: 30.h),
              LanguageCarousel(),
              VerticalSizedBox(vertical: 40.h),
              Image.asset(
                logo2,
                height: 220.h,
                width: 210.w,
              ),
              VerticalSizedBox(vertical: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomButton(
                  title: "Sign Up With Email",
                  icon: Icons.email_outlined,
                  onPressed: () {
                    loginMethodProvider.setLoginMethod("email");
                    Navigator.pushNamed(context, RoutesName.signUp);
                  },
                ),
              ),
              VerticalSizedBox(vertical: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomButton(
                  title: "Sign Up Phone No.",
                  icon: Icons.phone_android_outlined,
                  onPressed: () {
                    loginMethodProvider.setLoginMethod("phone");
                    Navigator.pushNamed(context, RoutesName.signUp);
                  },
                ),
              ),
              VerticalSizedBox(vertical: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Already have an account? ",
                    fontSize: 14.sp,
                    color: blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.loginoption);
                    },
                    child: CustomText(
                      text: "Sign In",
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
