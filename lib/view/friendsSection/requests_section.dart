import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';

class RequestSection extends StatefulWidget {
  const RequestSection({super.key});

  @override
  State<RequestSection> createState() => _RequestSectionState();
}

class _RequestSectionState extends State<RequestSection> {
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
              text: "Friends Requests ",
              fontSize: 22.sp,
              color: blackColor,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemCount: _allItems.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  VerticalSizedBox(vertical: 15.h),
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
                        CustomContainer(
                          borderRadius: 10.r,
                          borderColor: baseColor,
                          backgroundColor: baseColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 3.h),
                            child: CustomText(
                              text: "Accept",
                              fontSize: 14.sp,
                              color: whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        HorizontalSizedBox(horizontalSpace: 10.w),
                        CustomContainer(
                          borderRadius: 10.r,
                          borderColor: baseColor,
                          backgroundColor: whiteColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 3.h),
                            child: CustomText(
                              text: "Decline",
                              fontSize: 14.sp,
                              color: baseColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        HorizontalSizedBox(horizontalSpace: 25.w),
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
