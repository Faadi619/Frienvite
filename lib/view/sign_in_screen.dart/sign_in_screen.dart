import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frienivite_app/Core/Components/app_button.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
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
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:wheel_slider/wheel_slider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'US';
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  @override
  Widget build(BuildContext context) {
    final loginMethodProvider = Provider.of<LoginMethodProvider>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              VerticalSizedBox(vertical: 10.h),
              LanguageCarousel(),
              Image.asset(
                logo2,
                height: 230.h,
              ),
              VerticalSizedBox(vertical: 10.h),
              CustomText(
                text: "Welcome Back!",
                fontSize: 28.sp,
                color: blackColor,
                fontWeight: FontWeight.w600,
              ),
              VerticalSizedBox(vertical: 10.h),
              loginMethodProvider.loginMethod == "email"
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomTextField(
                        title: 'Email',
                        hintText: 'Email',
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
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            HorizontalSizedBox(horizontalSpace: 25.w),
                            CustomText(
                              text: "Phone No.",
                              fontSize: 14.sp,
                              color: blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        VerticalSizedBox(vertical: 15.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: CustomContainer(
                            shadow: true,
                            height: 60.h,
                            borderRadius: 10.r,
                            child: InternationalPhoneNumberInput(
                              spaceBetweenSelectorAndTextField: 0,
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                              inputDecoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 12.h),
                                hintText: 'Phone No.',
                                hintStyle: TextStyle(color: blackColor),
                                border: InputBorder.none,
                              ),
                              hintText: 'Phone No.',
                              inputBorder: InputBorder.none,
                              onInputChanged: (number) {
                                print(number.phoneNumber);
                              },
                              onInputValidated: (bool value) {
                                print(value);
                              },
                              selectorConfig: const SelectorConfig(
                                showFlags: true,
                                leadingPadding: 20,
                                selectorType:
                                    PhoneInputSelectorType.BOTTOM_SHEET,
                                useBottomSheetSafeArea: true,
                              ),
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle: TextStyle(color: Colors.black),
                              initialValue: number,
                              textFieldController: controller,
                              formatInput: true,
                              keyboardType: TextInputType.numberWithOptions(
                                  signed: true, decimal: true),
                              onSaved: (number) {
                                print('On Saved: $number');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
              VerticalSizedBox(vertical: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomPasswordTextField(
                  title: "Password",
                  hintText: "Password",
                  prefixicon: SvgPicture.asset(
                    pass,
                    height: 20.sp,
                    width: 20.sp,
                    placeholderBuilder: (BuildContext context) =>
                        const CircularProgressIndicator(),
                  ),
                ),
              ),
              VerticalSizedBox(vertical: 17.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.forgetpass);
                    },
                    child: CustomText(
                      text: "Forgot Password?",
                      fontSize: 12.sp,
                      color: greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  HorizontalSizedBox(horizontalSpace: 20.w),
                ],
              ),
              VerticalSizedBox(vertical: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomButton(
                  title: "Sign in",
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.home);
                  },
                ),
              ),
              VerticalSizedBox(vertical: 25.h),
              SvgPicture.asset(
                divider,
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    google,
                    height: 50.h,
                  ),
                  HorizontalSizedBox(horizontalSpace: 15.w),
                  Icon(
                    Icons.apple,
                    size: 50.sp,
                  ),
                ],
              ),
              VerticalSizedBox(vertical: 20.h),
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
                      Navigator.pushNamed(context, RoutesName.signUp);
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
              VerticalSizedBox(vertical: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
