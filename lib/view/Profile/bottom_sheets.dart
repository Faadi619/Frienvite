import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/colors.dart';

class LogoutBottomSheet extends StatefulWidget {
  const LogoutBottomSheet({super.key});

  @override
  State<LogoutBottomSheet> createState() => _LogoutBottomSheetState();
}

class _LogoutBottomSheetState extends State<LogoutBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.35.sh,
      child: Column(
        children: [
          VerticalSizedBox(vertical: 20.h),
          CustomContainer(
            height: 3.h,
            width: 30.w,
            backgroundColor: lightGrey,
          ),
          VerticalSizedBox(vertical: 20.h),
          CustomText(
            text: "Logout",
            fontSize: 24.sp,
            color: blackColor,
            fontWeight: FontWeight.w600,
          ),
          VerticalSizedBox(vertical: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: const Divider(),
          ),
          VerticalSizedBox(vertical: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: CustomText(
              textAlign: TextAlign.center,
              text: "Are you sure you want to logout fromthe app?",
              fontSize: 15.sp,
              color: blackColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          VerticalSizedBox(vertical: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomContainer(
                borderRadius: 20.r,
                backgroundColor: greyColor.withOpacity(0.2),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 12.h),
                  child: CustomText(
                    text: "Cancel",
                    fontSize: 14.sp,
                    color: blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              HorizontalSizedBox(horizontalSpace: 20.w),
              CustomContainer(
                borderRadius: 20.r,
                backgroundColor: whiteColor,
                borderColor: greyColor,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 12.h),
                  child: CustomText(
                    text: "Confirm",
                    fontSize: 14.sp,
                    color: blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class DeleteAccountBottomSheet extends StatefulWidget {
  DeleteAccountBottomSheet({super.key});

  @override
  State<DeleteAccountBottomSheet> createState() =>
      _DeleteAccountBottomSheetState();
}

class _DeleteAccountBottomSheetState extends State<DeleteAccountBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.35.sh,
      child: Column(
        children: [
          VerticalSizedBox(vertical: 20.h),
          CustomContainer(
            height: 3.h,
            width: 30.w,
            backgroundColor: lightGrey,
          ),
          VerticalSizedBox(vertical: 20.h),
          CustomText(
            text: "Delete Account",
            fontSize: 24.sp,
            color: pinkColor,
            fontWeight: FontWeight.w600,
          ),
          VerticalSizedBox(vertical: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: const Divider(),
          ),
          VerticalSizedBox(vertical: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: CustomText(
              textAlign: TextAlign.center,
              text: "Are you sure you want to delete your account? ",
              fontSize: 15.sp,
              color: blackColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          VerticalSizedBox(vertical: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomContainer(
                borderRadius: 20.r,
                backgroundColor: greyColor.withOpacity(0.2),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 12.h),
                  child: CustomText(
                    text: "Cancel",
                    fontSize: 14.sp,
                    color: blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              HorizontalSizedBox(horizontalSpace: 20.w),
              CustomContainer(
                borderRadius: 20.r,
                backgroundColor: pinkColor,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.w, vertical: 12.h),
                  child: CustomText(
                    text: "Yes, Delete",
                    fontSize: 14.sp,
                    color: whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
