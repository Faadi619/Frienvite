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
import 'package:get/get.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: baseColor,
                    ),
                  ),
                ],
              ),
              VerticalSizedBox(vertical: 20.h),
              SvgPicture.asset(
                forgetpass,
                height: 230.h,
              ),
              VerticalSizedBox(vertical: 20.h),
              CustomText(
                text: "Forgot Your Password?",
                fontSize: 28.sp,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
              VerticalSizedBox(vertical: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomText(
                  textAlign: TextAlign.center,
                  text: "No worries! Enter your email address below and "
                      "we will send you a link to reset your password.",
                  fontSize: 14.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              VerticalSizedBox(vertical: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomTextField(
                  title: 'Email',
                  hintText: 'yourname@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  prefixicon: SvgPicture.asset(
                    email,
                    height: 16.sp,
                    width: 16.sp,
                  ),
                  onChanged: (value) {
                    // Handle email input
                  },
                ),
              ),
              VerticalSizedBox(vertical: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomButton(title: "Continue", onPressed: () {}),
              ),
              VerticalSizedBox(vertical: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
