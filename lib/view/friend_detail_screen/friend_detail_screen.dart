import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frienivite_app/Core/Components/app_bar_widget.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/view/Event_Detail_Screen/event_detail_screen.dart';
import 'package:frienivite_app/view/groups/chat_header.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Core/multiproviders_list/previous_page.dart';
import '../../utils/routes/routes_name.dart';

class FriendDetailScreen extends StatefulWidget {
  const FriendDetailScreen({super.key});

  @override
  State<FriendDetailScreen> createState() => _FriendDetailScreenState();
}

class _FriendDetailScreenState extends State<FriendDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final previousPage = Provider.of<NavigationProvider>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              VerticalSizedBox(vertical: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 25.sp,
                        color: baseColor,
                      ),
                    ),
                    SvgPicture.asset(
                      logo1,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return MyDialougeBoxWidget(
                              title:
                                  "Are you sure you want to remove Rocks Velkeinjen?",
                              context: context,
                              description:
                                  "Are you sure you want to continue this? If you "
                                  "continue it, You will not be able to change it",
                            );
                          },
                        );
                      },
                      child: CustomContainer(
                        borderRadius: 8.r,
                        backgroundColor: pinkColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          child: CustomText(
                            text: "Remove",
                            fontSize: 13.sp,
                            color: whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              VerticalSizedBox(vertical: 15.h),
              Row(
                children: [
                  Image.asset(
                    p1,
                    height: 120.h,
                  ),
                  HorizontalSizedBox(horizontalSpace: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Rocks Velkeinjen ",
                        fontSize: 26.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        text: "Rocks_velkeinjen @example.com ",
                        fontSize: 14.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  )
                ],
              ),
              VerticalSizedBox(vertical: 15.h),
              CustomTextFieldFriend(
                title: 'Full Name',
                name: "Micheal Ulasi",
                icon: Icons.person_outline_outlined,
              ),
              VerticalSizedBox(vertical: 25.h),
              CustomTextFieldFriend(
                title: 'Email',
                name: "micheal_ulasi@example.com",
                icon: Icons.email_outlined,
              ),
              VerticalSizedBox(vertical: 25.h),
              CustomTextFieldFriend(
                title: 'Phone No.',
                name: "+1 827 098 890",
                icon: Icons.phone_android_outlined,
              ),
              VerticalSizedBox(vertical: 20.h),
              Row(
                children: [
                  HorizontalSizedBox(horizontalSpace: 10.w),
                  CustomText(
                    text: "Events In Common",
                    fontSize: 23.sp,
                    color: blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              // Event list
              ListView.builder(
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // previousPage.setPreviousPage(frompolls);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => EventDetailScreen(
                            image: eventdumy,
                            title: 'Dance party at the top of the town - 2024',
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomContainer(
                        borderColor: greyColor.withOpacity(0.2),
                        borderRadius: 10.r,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(12.r),
                                  child: Image.asset(
                                    eventdumy,
                                    height: 90.h,
                                  ),
                                ),
                                HorizontalSizedBox(horizontalSpace: 10.w),
                                SizedBox(
                                  width: 0.58.sw,
                                  child: Column(
                                    children: [
                                      VerticalSizedBox(vertical: 15.h),
                                      CustomText(
                                        text:
                                            "Dance party at the top of the town - 2024",
                                        fontSize: 14.sp,
                                        color: blackColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      VerticalSizedBox(vertical: 20.h),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on_outlined,
                                            color: blackColor,
                                          ),
                                          HorizontalSizedBox(
                                            horizontalSpace: 5.w,
                                          ),
                                          CustomText(
                                            text: "New York",
                                            fontSize: 12.sp,
                                            color: greyColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      VerticalSizedBox(vertical: 15.h),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                HorizontalSizedBox(horizontalSpace: 15.w),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldFriend extends StatelessWidget {
  CustomTextFieldFriend({
    super.key,
    required this.title,
    required this.icon,
    required this.name,
  });
  String title;
  String name;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            HorizontalSizedBox(horizontalSpace: 20.w),
            CustomText(
              text: title,
              fontSize: 14.sp,
              color: blackColor,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        VerticalSizedBox(vertical: 15.h),
        Row(
          children: [
            HorizontalSizedBox(horizontalSpace: 30.w),
            Icon(icon),
            HorizontalSizedBox(horizontalSpace: 15.w),
            CustomText(
              text: name,
              fontSize: 14.sp,
              color: blackColor,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ],
    );
  }
}
