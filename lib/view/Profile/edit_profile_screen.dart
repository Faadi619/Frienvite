import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frienivite_app/Core/Components/app_button.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/custom_textfiled1.dart';
import 'package:frienivite_app/Core/Components/editprofiletextfield.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/view/friend_detail_screen/friend_detail_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  PhoneNumber number = PhoneNumber(isoCode: 'US');
  TextEditingController phoneController =
      TextEditingController(text: '827098890');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              VerticalSizedBox(vertical: 10.h),
              const ProfileScreenAppBar(),
              VerticalSizedBox(vertical: 25.h),
              const EditProfilePicAndName(),
              VerticalSizedBox(vertical: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const EditProfileTextField(
                  title: "Full Name",
                  hintText: "Micheal Ulasi",
                  prefixicon: Icon(Icons.person),
                  // suffixIcon: Icon(Icons.edit),
                ),
              ),
              VerticalSizedBox(vertical: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const EditProfileTextField(
                  title: "Email",
                  hintText: "micheal_ulasi@example.com",
                  prefixicon: Icon(Icons.email),
                  // suffixIcon: Icon(Icons.edit),
                ),
              ),
              VerticalSizedBox(vertical: 20.h),
              Column(
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
                  VerticalSizedBox(vertical: 10.h),
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
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          useBottomSheetSafeArea: true,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        initialValue: number,
                        textFieldController: phoneController,
                        formatInput: true,
                        keyboardType: const TextInputType.numberWithOptions(
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
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Column(
                  children: [
                    Row(
                      children: [
                        HorizontalSizedBox(horizontalSpace: 12.w),
                        CustomText(
                          text: "Birthday",
                          fontSize: 14.sp,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    VerticalSizedBox(vertical: 10.h),
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(14.r),
                          boxShadow: [
                            BoxShadow(
                              color: blackColor.withOpacity(0.25),
                              blurRadius: 24.0,
                              spreadRadius: 2.0,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            HorizontalSizedBox(horizontalSpace: 20.w),
                            SvgPicture.asset(person,
                                height: 16.sp, width: 16.sp),
                            HorizontalSizedBox(horizontalSpace: 20.w),
                            CustomText(
                              // ignore: unnecessary_null_comparison
                              text: selectedDate != null
                                  ? "${selectedDate?.day}/${selectedDate?.month}/${selectedDate?.year}"
                                  : "Select Date",
                              fontSize: 14.sp,
                              color: blackColor,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              VerticalSizedBox(vertical: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const EditProfileTextField(
                  title: "Password",
                  hintText: "**************",
                  obscureText: true,
                  prefixicon: Icon(Icons.lock),
                  // suffixIcon: Icon(Icons.edit),
                ),
              ),
              VerticalSizedBox(vertical: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: CustomButton(title: "Save Changes", onPressed: () {}),
              ),
              VerticalSizedBox(vertical: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfilePicAndName extends StatelessWidget {
  const EditProfilePicAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HorizontalSizedBox(horizontalSpace: 10.w),
        const ProfilePic(),
        HorizontalSizedBox(horizontalSpace: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Micheal Ulasi",
              fontSize: 20.sp,
              color: blackColor,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              width: 0.60.sw,
              child: CustomText(
                text: "micheal_ulasi@example.com",
                fontSize: 13.sp,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class ProfileScreenCustomRowWidget extends StatelessWidget {
  String title;
  IconData icon;
  ProfileScreenCustomRowWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            HorizontalSizedBox(horizontalSpace: 20.w),
            Icon(
              icon,
            ),
            HorizontalSizedBox(horizontalSpace: 15.w),
            CustomText(
              text: title,
              fontSize: 17.sp,
              color: blackColor,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
        VerticalSizedBox(vertical: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: const Divider(),
        ),
      ],
    );
  }
}

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    super.key,
  });

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _image;

  imagepicker() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Profile Image
        CircleAvatar(
          radius: 60,
          backgroundImage: _image != null
              ? Image.file(_image!).image
              : Image.asset(p1).image, // Replace with your image URL
        ),
        // Camera Icon
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              imagepicker();
            },
            child: Container(
              padding: EdgeInsets.all(5.r), // Add some padding around the icon
              decoration: const BoxDecoration(
                color: baseColor, // Background color of the icon container
                shape: BoxShape.circle, // Make it circular
              ),
              child: const Icon(
                Icons.camera_alt,
                color: whiteColor, // Icon color
                size: 20, // Icon size
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileScreenAppBar extends StatelessWidget {
  const ProfileScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: baseColor,
            ),
          ),
          CustomText(
            text: "My Profile",
            fontSize: 21.sp,
            color: blackColor,
            fontWeight: FontWeight.w500,
          ),
          const Icon(
            Icons.arrow_back,
            color: Colors.transparent,
          )
        ],
      ),
    );
  }
}
