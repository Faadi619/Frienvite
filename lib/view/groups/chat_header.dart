// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/view/groups/edit_group.dart';

class ChatHeader extends StatefulWidget {
  const ChatHeader({super.key});

  @override
  State<ChatHeader> createState() => _ChatHeaderState();
}

class _ChatHeaderState extends State<ChatHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSizedBox(vertical: 10.h),
        Row(
          children: [
            HorizontalSizedBox(horizontalSpace: 15.w),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: baseColor,
              ),
            ),
            HorizontalSizedBox(horizontalSpace: 10.w),
            Image.asset(
              profil2,
              height: 50.h,
              width: 50.w,
            ),
            HorizontalSizedBox(horizontalSpace: 10.w),
            CustomText(
              text: "Family Event Group",
              fontSize: 20.sp,
              color: blackColor,
              fontWeight: FontWeight.bold,
            ),
            const Spacer(),
            const ChatReportButton(),
            // HorizontalSizedBox(horizontalSpace: 10.w),
          ],
        ),
        VerticalSizedBox(vertical: 30.h),
        CustomText(
          text: "Saturday, March 14, 2022",
          fontSize: 15.sp,
          color: blackColor,
          fontWeight: FontWeight.w500,
        ),
        VerticalSizedBox(vertical: 10.h),
      ],
    );
  }
}

////
class ChatReportButton extends StatefulWidget {
  const ChatReportButton({
    super.key,
  });

  @override
  State<ChatReportButton> createState() => _ChatReportButtonState();
}

class _ChatReportButtonState extends State<ChatReportButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: whiteColor,
      surfaceTintColor: whiteColor,
      elevation: 5,
      position: PopupMenuPosition.under,
      offset: Offset(-20.sp, -12.sp),
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.more_vert,
        size: 25.sp,
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          onTap: () {
            showMaterialModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.r),
                ),
              ),
              context: context,
              builder: (context) => const EditGroupBottomSheet(),
            );
          },
          height: 25.h,
          value: 'Edit',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HorizontalSizedBox(horizontalSpace: 10),
              CustomText(
                text: "Edit Group",
                fontSize: 12,
                color: blackColor,
                fontWeight: FontWeight.w500,
              ),
              const HorizontalSizedBox(horizontalSpace: 10),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<String>(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return MyDialougeBoxWidget(
                  title: "Are you sure you want to delete this Group?",
                  context: context,
                  description: "Are you sure you want to continue this? If you "
                      "continue it, You will not be able to change it",
                );
              },
            );
          },
          value: 'Delete',
          height: 25.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HorizontalSizedBox(horizontalSpace: 10),
              CustomText(
                text: "Delete Group",
                fontSize: 12,
                color: pinkColor,
                fontWeight: FontWeight.w500,
              ),
              const HorizontalSizedBox(horizontalSpace: 10),
            ],
          ),
        ),
      ],
      onSelected: (String value) {},
    );
  }
}

// ignore: must_be_immutable
class MyDialougeBoxWidget extends StatefulWidget {
  String title;
  String? description;
  BuildContext context;
  VoidCallback? onTap;
  MyDialougeBoxWidget(
      {super.key,
      required this.title,
      required this.context,
      this.description,
      this.onTap});

  @override
  State<MyDialougeBoxWidget> createState() => _MyDialougeBoxWidgetState();
}

class _MyDialougeBoxWidgetState extends State<MyDialougeBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomText(
        // text: "Are you sure you want to delete this Group?",
        text: widget.title,
        fontSize: 21.sp,
        color: blackColor,
        fontWeight: FontWeight.w700,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            CustomText(
              text: widget.description ?? '',
              // "Are you sure you want to continue this? If you continue it,"
              // " You will not be able to change it",
              fontSize: 14.sp,
              color: blackColor.withOpacity(0.5),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CustomContainer(
                  borderColor: baseColor,
                  borderRadius: 12.r,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 9.h),
                    child: CustomText(
                      text: "No",
                      color: baseColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              HorizontalSizedBox(horizontalSpace: 10.w),
              GestureDetector(
                onTap: () {
                  widget.onTap!();
                  Navigator.pop(context);
                },
                child: CustomContainer(
                  backgroundColor: baseColor,
                  borderColor: baseColor,
                  borderRadius: 12.r,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
                    child: CustomText(
                      text: "Yes, confirm",
                      color: whiteColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
