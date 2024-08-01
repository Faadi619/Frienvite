import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frienivite_app/Core/Components/app_button.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/view/Profile/profile_screen.dart';
import 'package:frienivite_app/view/groups/add_group_bottomsheet.dart';
import 'package:frienivite_app/view/groups/edit_group.dart';

class LangugaeScreen extends StatefulWidget {
  const LangugaeScreen({super.key});

  @override
  State<LangugaeScreen> createState() => _LangugaeScreenState();
}

class _LangugaeScreenState extends State<LangugaeScreen> {
  int selected = 0;
  final List<Language> languages = [
    Language(name: 'English', flagUrl: english),
    Language(name: 'German', flagUrl: german),
    Language(name: 'Spanish', flagUrl: spanish),
    Language(name: 'Arabic', flagUrl: arabic),
    Language(name: 'French', flagUrl: french),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              VerticalSizedBox(vertical: 10.h),
              ProfileScreenAppBar(title: ""),
              Icon(
                Icons.language,
                size: 80.sp,
              ),
              VerticalSizedBox(vertical: 15.h),
              CustomText(
                text: "Select Language",
                fontSize: 24.sp,
                color: blackColor,
                fontWeight: FontWeight.w600,
              ),
              VerticalSizedBox(vertical: 40.h),
              const LanguageSeachField(),
              VerticalSizedBox(vertical: 20.h),
              languageSelectionWidget(),
              VerticalSizedBox(vertical: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: CustomButton(title: "Save", onPressed: () {}),
              ),
              VerticalSizedBox(vertical: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox languageSelectionWidget() {
    return SizedBox(
      height: 400.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: languages.length,
        itemBuilder: (context, index) {
          final language = languages[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {});
                      selected = index;
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            language.flagUrl,
                          ),
                          HorizontalSizedBox(horizontalSpace: 20.w),
                          CustomText(
                            text: language.name,
                            fontSize: 14.sp,
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                          const Spacer(),
                          Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selected == index ? baseColor : greyColor,
                            ),
                            child: const Icon(
                              Icons.done,
                              color: whiteColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                VerticalSizedBox(vertical: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Divider(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class LanguageSeachField extends StatelessWidget {
  const LanguageSeachField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          contentPadding: EdgeInsets.only(
            left: 20.w,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  Colors.grey.shade300, // Light grey color for enabled border
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: baseColor,
            ),
            borderRadius: BorderRadius.circular(50.r),
          ),
          suffixIcon: const Icon(
            Icons.search,
            color: baseColor,
          ),
        ),
      ),
    );
  }
}

class Language {
  final String name;
  final String flagUrl;

  Language({required this.name, required this.flagUrl});
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

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Profile Image
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(p1), // Replace with your image URL
        ),
        // Camera Icon
        Positioned(
          bottom: 0,
          right: 0,
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
      ],
    );
  }
}
