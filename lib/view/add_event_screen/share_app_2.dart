import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';

class ShareAppBottomSheet2 extends StatefulWidget {
  const ShareAppBottomSheet2({super.key});

  @override
  State<ShareAppBottomSheet2> createState() => _ShareAppBottomSheet2State();
}

class _ShareAppBottomSheet2State extends State<ShareAppBottomSheet2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 0.25.sh,
      child: Column(
        children: [
          VerticalSizedBox(vertical: 20.h),
          CustomContainer(
            width: 30.w,
            height: 4.h,
            backgroundColor: greyColor,
          ),
          VerticalSizedBox(vertical: 6.h),
          CustomText(
            text: "Invite Friends",
            fontSize: 24.sp,
            color: blackColor,
            fontWeight: FontWeight.w600,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: const Divider(color: blackColor),
          ),
          VerticalSizedBox(vertical: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShareAppWidget(
                  imagURl: whatsapp,
                  name: "WhatsApp",
                ),
                ShareAppWidget(
                  imagURl: email1,
                  name: "Email",
                ),
                ShareAppWidget(
                  imagURl: sms,
                  name: "SMS",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShareAppWidget extends StatelessWidget {
  String imagURl;
  String name;
  ShareAppWidget({
    super.key,
    required this.imagURl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          imagURl,
          height: 60.h,
        ),
        VerticalSizedBox(vertical: 5.h),
        CustomText(
          text: name,
          fontSize: 14.sp,
          color: blackColor,
          fontWeight: FontWeight.w600,
        )
      ],
    );
  }
}
