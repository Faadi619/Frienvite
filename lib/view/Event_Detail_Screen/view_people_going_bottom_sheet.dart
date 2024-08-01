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
import 'package:frienivite_app/view/friendsSection/friends_section.dart';

class ViewPeopleBottomSheet extends StatefulWidget {
  const ViewPeopleBottomSheet({super.key});

  @override
  State<ViewPeopleBottomSheet> createState() => _ViewPeopleBottomSheetState();
}

class _ViewPeopleBottomSheetState extends State<ViewPeopleBottomSheet> {
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
          CustomText(
            text: "Going",
            fontSize: 24.sp,
            color: blackColor,
            fontWeight: FontWeight.w500,
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
                        CustomContainer(
                          width: 80.w,
                          height: 30.h,
                          borderRadius: 15.r,
                          backgroundColor:
                              users[index].isFriend ? baseColor : whiteColor,
                          borderColor:
                              users[index].isFriend ? whiteColor : baseColor,
                          child: Center(
                            child: Text(
                              users[index].isFriend ? 'Friend' : 'Add',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: users[index].isFriend
                                      ? whiteColor
                                      : baseColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    //TODO
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
  bool isFriend;

  UserModal({
    required this.name,
    required this.profilePicture,
    required this.isFriend,
  });
}

List<UserModal> users = [
  UserModal(name: "John Doe", profilePicture: p1, isFriend: true),
  UserModal(name: "Jane Smith", profilePicture: p1, isFriend: true),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: true),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: true),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: true),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: true),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: false),
  UserModal(name: "Alice Johnson", profilePicture: p1, isFriend: false),
];

List<UserModal> selected = [];
