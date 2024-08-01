import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';
import 'package:frienivite_app/view/groups/chat_header.dart';

class FriendsSection extends StatefulWidget {
  const FriendsSection({super.key});

  @override
  State<FriendsSection> createState() => _FriendsSectionState();
}

class _FriendsSectionState extends State<FriendsSection> {
  List<String> _allItems = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eve',
    'Frank',
    'Grace',
    'Hannah',
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Eve',
    'Frank',
    'Grace',
    'Hannah',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSizedBox(vertical: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SearchField(),
        ),
        VerticalSizedBox(vertical: 20.h),
        Row(
          children: [
            HorizontalSizedBox(horizontalSpace: 20.w),
            CustomText(
              text: "My Friends ",
              fontSize: 22.sp,
              color: blackColor,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: "(130)",
              fontSize: 22.sp,
              color: blackColor,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
        VerticalSizedBox(vertical: 12.h),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemCount: _allItems.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.friendDetail);
                    },
                    child: Row(
                      children: [
                        HorizontalSizedBox(horizontalSpace: 15.w),
                        Image.asset(
                          p1,
                          height: 61.h,
                          width: 61.w,
                        ),
                        HorizontalSizedBox(horizontalSpace: 10.w),
                        CustomText(
                          text: _allItems[index],
                          fontSize: 14.sp,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return MyDialougeBoxWidget(
                                  title:
                                      "Are you sure you want to remove ${_allItems[index]}?",
                                  context: context,
                                  description:
                                      "Are you sure you want to continue this? If you "
                                      "continue it, You will not be able to change it",
                                );
                              },
                            );
                          },
                          child: CustomContainer(
                            borderRadius: 10.r,
                            backgroundColor: pinkColor,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 3.h),
                              child: CustomText(
                                text: "Remove",
                                fontSize: 14.sp,
                                color: whiteColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        HorizontalSizedBox(horizontalSpace: 15.w),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                    child: const Divider(),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

//search field
class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: baseColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
