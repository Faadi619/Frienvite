import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';

class InviteFriendsBottomSheeta extends StatefulWidget {
  const InviteFriendsBottomSheeta({super.key});

  @override
  State<InviteFriendsBottomSheeta> createState() =>
      _InviteFriendsBottomSheetaState();
}

class _InviteFriendsBottomSheetaState extends State<InviteFriendsBottomSheeta> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.82.sh,
      child: DefaultTabController(
        length: 2,
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
            Row(
              children: [
                HorizontalSizedBox(horizontalSpace: 20.w),
                CustomText(
                  text: "Invite Friends",
                  fontSize: 24.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ],
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
            const InviteFriendsTabBar(),
            VerticalSizedBox(vertical: 10.h),
            Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  friendsWidget(),
                  friendsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView friendsWidget() {
    return ListView.builder(
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
            child: GestureDetector(
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
          ),
        );
      },
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
  UserModal(
    name: "Jane Smith",
    profilePicture: p1,
    isSelected: false,
  ),
  UserModal(
    name: "Alice Johnson",
    profilePicture: p1,
    isSelected: false,
  ),
  UserModal(
    name: "Alice Johnson",
    profilePicture: p1,
    isSelected: false,
  ),
  UserModal(
    name: "Alice Johnson",
    profilePicture: p1,
    isSelected: false,
  ),
  UserModal(
    name: "Alice Johnson",
    profilePicture: p1,
    isSelected: false,
  ),
  UserModal(
    name: "Alice Johnson",
    profilePicture: p1,
    isSelected: false,
  ),
  UserModal(
    name: "Alice Johnson",
    profilePicture: p1,
    isSelected: false,
  ),
];

List<UserModal> selected = [];

//Tab Bar Header
class InviteFriendsTabBar extends StatelessWidget {
  const InviteFriendsTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      tabs: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.sp, top: 10.sp),
          child: Text(
            "Friends",
            style: TextStyle(
              fontSize: 14.sp,
              // color: blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10.sp, top: 10.sp),
          child: Text(
            "Groups",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
      indicator: UnderlineTabIndicator(
        borderRadius: BorderRadius.circular(60.r),
        borderSide: BorderSide(width: 5.sp, color: baseColor),
      ),
      labelColor: baseColor,
      unselectedLabelColor: Color(0xffA7A7A7),
    );
  }
}
