import 'dart:async';

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
import 'package:frienivite_app/test.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';
import 'package:frienivite_app/view/loginoption/login_option_provider.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginMethodProvider = Provider.of<LoginMethodProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              VerticalSizedBox(vertical: 20.h),
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
                  const SizedBox(),
                ],
              ),

              SvgPicture.asset(
                phone,
                height: 230.h,
              ),
              VerticalSizedBox(vertical: 20.h),
              loginMethodProvider.loginMethod == "email"
                  ? CustomText(
                      text: "Confirm Your Email",
                      fontSize: 28.sp,
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                    )
                  : CustomText(
                      text: "Confirm Your Number",
                      fontSize: 28.sp,
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                    ),
              VerticalSizedBox(vertical: 15.h),
              loginMethodProvider.loginMethod == "email"
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomText(
                        textAlign: TextAlign.center,
                        text:
                            "Click on the link we sent to your email \n[email]",
                        fontSize: 14.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomText(
                        textAlign: TextAlign.center,
                        text: "Enter the code we send over SMS to"
                            "\n[provided number]",
                        fontSize: 14.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
              VerticalSizedBox(vertical: 20.h),
              loginMethodProvider.loginMethod == "email"
                  ? const SizedBox()
                  : phoneVerificationTextfileds(context),
              // VerticalSizedBox(vertical: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loginMethodProvider.loginMethod == "email"
                      ? CustomText(
                          text: "Didn't get the link? ",
                          fontSize: 16.sp,
                          color: blackColor,
                          fontWeight: FontWeight.w400,
                        )
                      : CustomText(
                          text: "Didn't get the code? ",
                          fontSize: 16.sp,
                          color: blackColor,
                          fontWeight: FontWeight.w400,
                        ),
                  CustomText(
                    text: "Resend",
                    underline: true,
                    fontSize: 16.sp,
                    color: baseColor,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              VerticalSizedBox(vertical: 40.h),
              loginMethodProvider.loginMethod == "email"
                  ? const SizedBox()
                  : VerticalSizedBox(vertical: 60.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomButton(
                  title: "Continue",
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.home);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Form phoneVerificationTextfileds(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 30,
        ),
        child: PinCodeTextField(
          appContext: context,
          pastedTextStyle: const TextStyle(
            color: baseColor,
            fontWeight: FontWeight.bold,
          ),
          length: 6,
          obscureText: true,
          obscuringCharacter: '*',
          blinkWhenObscuring: true,
          animationType: AnimationType.scale,
          // validator: (v) {
          //   if (v!.length < 3) {
          //     return "I'm from validator";
          //   } else {
          //     return null;
          //   }
          // },
          pinTheme: PinTheme(
            activeColor: whiteColor,
            disabledColor: baseColor,
            inactiveColor: baseColor,
            selectedColor: baseColor,
            selectedBorderWidth: 1.sp,
            inactiveBorderWidth: 1.sp,
            selectedFillColor: whiteColor,
            inactiveFillColor: whiteColor,
            activeBoxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(0.25), // Shadow color with opacity
                offset: const Offset(0, 4), // Horizontal and vertical offset
                blurRadius: 24, // Blur radius
                spreadRadius: 0, // Spread radius
              ),
            ],
            inActiveBoxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(0.25), // Shadow color with opacity
                offset: const Offset(0, 4), // Horizontal and vertical offset
                blurRadius: 24, // Blur radius
                spreadRadius: 0, // Spread radius
              ),
            ],
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
          ),
          cursorColor: Colors.black,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          errorAnimationController: errorController,
          controller: textEditingController,
          keyboardType: TextInputType.number,
          boxShadows: const [
            BoxShadow(
              offset: Offset(0, 1),
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
          onCompleted: (v) {
            debugPrint("Completed");
          },
          // onTap: () {
          //   print("Pressed");
          // },
          onChanged: (value) {
            debugPrint(value);
            setState(() {
              currentText = value;
            });
          },
          beforeTextPaste: (text) {
            debugPrint("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      ),
    );
  }
}
