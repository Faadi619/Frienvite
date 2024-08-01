import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/Components/textfield_container.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/utils/utils.dart';
import 'package:frienivite_app/view/friendsSection/friends_section.dart';
import 'package:get/get.dart';

class AddGroupBottomSheet extends StatefulWidget {
  const AddGroupBottomSheet({super.key});

  @override
  State<AddGroupBottomSheet> createState() => _AddGroupBottomSheetState();
}

class _AddGroupBottomSheetState extends State<AddGroupBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.80.sh,
      child: Column(
        children: [
          VerticalSizedBox(vertical: 20.h),
          CustomContainer(
            height: 3.h,
            width: 20.w,
            backgroundColor: lightGrey,
            borderRadius: 20.r,
          ),
          VerticalSizedBox(vertical: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                CustomText(
                  text: "Create Group",
                  fontSize: 24.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                ),
                GestureDetector(
                  onTap: () {
                    //TODO: Add function here.
                    Get.back();
                    Utils.successflushbarMessage(
                      'Group Added',
                      context,
                    );
                  },
                  child: CustomContainer(
                    borderRadius: 8.r,
                    backgroundColor: greenColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      child: CustomText(
                        text: "Save",
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
          VerticalSizedBox(vertical: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HorizontalSizedBox(horizontalSpace: 10.w),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightGrey.withOpacity(0.7),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.r),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                  ),
                ),
              ),
              HorizontalSizedBox(horizontalSpace: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Group Name",
                    fontSize: 15.sp,
                    color: greyColor,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 0.8.sw,
                    child: SizedBox(
                      width: 0.65.sw,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        maxLines: 2,
                        style: TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: blackColor),
                          hintText: 'Enter group name ',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 70.w, right: 20.w),
            child: const Divider(),
          ),
          VerticalSizedBox(vertical: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: Icon(
                    Icons.search,
                    color: baseColor,
                    size: 30.sp,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.r),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.r),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.r),
                  borderSide: const BorderSide(
                    color: baseColor,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
          VerticalSizedBox(vertical: 15.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30.r,
                    backgroundImage: AssetImage(users[index].profilePicture),
                  ),
                  title: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: Row(
                      children: [
                        Text(users[index].name),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: users[index].isSelected == true
                                ? baseColor
                                : greyColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(5.sp),
                              child: Icon(
                                Icons.done,
                                color: whiteColor,
                                size: 15.sp,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {});
                    users[index].isSelected = !users[index].isSelected;
                    if (users[index].isSelected == true) {
                      selected.add(
                        UserModal(
                          name: users[index].name,
                          profilePicture: users[index].profilePicture,
                          isSelected: true,
                        ),
                      );
                    } else if (users[index].isSelected == false) {
                      selected.removeWhere(
                          (element) => element.name == users[index].name);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserModal {
  final String name;
  final String profilePicture;
  bool isSelected;

  UserModal({
    required this.name,
    required this.profilePicture,
    required this.isSelected,
  });
}

List<UserModal> users = [
  UserModal(name: "John Doe", profilePicture: p1, isSelected: false),
  UserModal(name: "Jane Smith", profilePicture: p1, isSelected: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isSelected: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isSelected: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isSelected: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isSelected: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isSelected: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isSelected: false),
];

List<UserModal> selected = [];
