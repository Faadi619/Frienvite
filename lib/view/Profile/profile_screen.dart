import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';
import 'package:frienivite_app/view/Profile/bottom_sheets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragUpdate: (details) {
            if (details.delta.dx > 2) {
              // Swipe from left to right, go back
              Navigator.pop(context);
              print("........................");
            }
          },
          child: SafeArea(
            child: Container(
              height: 1.sh,
              color: Colors.transparent,
              child: Column(
                children: [
                  VerticalSizedBox(vertical: 10.h),
                  ProfileScreenAppBar(),
                  VerticalSizedBox(vertical: 20.h),
                  const ProfilePic(),
                  VerticalSizedBox(vertical: 20.h),
                  CustomText(
                    text: "Micheal Ulasi",
                    fontSize: 20.sp,
                    color: blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                  VerticalSizedBox(vertical: 20.h),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.editprofile);
                    },
                    child: ProfileScreenCustomRowWidget(
                      icon: Icons.person_sharp,
                      title: "Profile",
                    ),
                  ),
                  VerticalSizedBox(vertical: 20.h),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.langugescreen);
                    },
                    child: ProfileScreenCustomRowWidget(
                      icon: Icons.language,
                      title: "Change Language",
                    ),
                  ),
                  VerticalSizedBox(vertical: 20.h),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.privacy);
                    },
                    child: ProfileScreenCustomRowWidget(
                      icon: Icons.privacy_tip,
                      title: "Privacy Policy",
                    ),
                  ),
                  VerticalSizedBox(vertical: 20.h),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      print("pesed.........");
                      showMaterialModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30.r),
                          ),
                        ),
                        context: context,
                        builder: (context) => DeleteAccountBottomSheet(),
                      );
                    },
                    child: Row(
                      children: [
                        HorizontalSizedBox(horizontalSpace: 20.w),
                        const Icon(
                          Icons.delete,
                          color: pinkColor,
                        ),
                        HorizontalSizedBox(horizontalSpace: 15.w),
                        CustomText(
                          text: "Delete Account",
                          fontSize: 17.sp,
                          color: pinkColor,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  ),
                  VerticalSizedBox(vertical: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Divider(),
                  ),
                  VerticalSizedBox(vertical: 20.h),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      print("pesed.........");
                      showMaterialModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30.r),
                          ),
                        ),
                        context: context,
                        builder: (context) => const LogoutBottomSheet(),
                      );
                    },
                    child: ProfileScreenCustomRowWidget(
                      icon: Icons.logout,
                      title: "Logout",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
              : Image.asset(p1).image,
        ),

        // Camera Icon
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
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
  String? title;
  ProfileScreenAppBar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              width: 30.w,
              height: 30.w,
              child: const Icon(
                Icons.arrow_back,
                color: baseColor,
              ),
            ),
          ),
          CustomText(
            text: title ?? "My Profile",
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
