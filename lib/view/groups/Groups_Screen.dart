import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';
import 'package:frienivite_app/view/friendsSection/friends_section.dart';
import 'package:frienivite_app/view/groups/add_group_bottomsheet.dart';
import 'package:frienivite_app/view/groups/chat_header.dart';
import 'package:frienivite_app/view/groups/chat_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class GroupSceen extends StatefulWidget {
  const GroupSceen({super.key});

  @override
  State<GroupSceen> createState() => _GroupSceenState();
}

class _GroupSceenState extends State<GroupSceen> {
  final List<Group> groups = [
    Group(
      name: "Group 1",
      messages: [
        Message(sender: "User1", text: "Hello!", isMe: false),
        Message(sender: "Me", text: "Hi there!", isMe: true),
      ],
    ),
    Group(
      name: "Group 2",
      messages: [
        Message(sender: "User2", text: "Hey!", isMe: false),
        Message(sender: "Me", text: "Hello2!", isMe: true),
      ],
    ),
    // Add more groups here
  ];

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AddGroupButton(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
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
                        child: const Icon(
                          Icons.arrow_back,
                          color: baseColor,
                        ),
                      ),
                      SvgPicture.asset(logo1),
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ),
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
                      text: "My Groups ",
                      fontSize: 25.sp,
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomText(
                      text: "(2)",
                      fontSize: 16.sp,
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                GroupsListView(groups: groups),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GroupsListView extends StatelessWidget {
  const GroupsListView({
    super.key,
    required this.groups,
  });

  final List<Group> groups;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                VerticalSizedBox(vertical: 5.h),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      FadePageRoute(
                        page: ChatScreen(group: groups[index]),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        HorizontalSizedBox(horizontalSpace: 10.w),
                        Column(
                          children: [
                            CustomText(
                              text: groups[index].name,
                              fontSize: 15.sp,
                              color: blackColor,
                              fontWeight: FontWeight.w700,
                            ),
                            CustomText(
                              text: groups[index].messages[index].text,
                              fontSize: 15.sp,
                              color: const Color(0xff6D6D6D),
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const Spacer(),
                        CustomContainer(
                          backgroundColor: const Color(0xff06ED1D),
                          height: 25.h,
                          width: 25.w,
                          borderRadius: 100.r,
                          child: Center(
                            child: CustomText(
                              text: '${index + 1}',
                              fontSize: 13.sp,
                              color: whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        // HorizontalSizedBox(horizontalSpace: 5.w),
                        const ChatReportButton()
                      ],
                    ),
                  ),
                ),
                VerticalSizedBox(vertical: 5.h),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AddGroupButton extends StatelessWidget {
  const AddGroupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showMaterialModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.r),
            ),
          ),
          context: context,
          builder: (context) => const AddGroupBottomSheet(),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 80.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: baseColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: whiteColor,
                  size: 40.sp,
                ),
              ),
            ),
          ),
          HorizontalSizedBox(horizontalSpace: 20.h)
        ],
      ),
    );
  }
}

class Group {
  final String name;
  final List<Message> messages;

  Group({required this.name, required this.messages});
}

class Message {
  final String sender;
  final String text;
  final bool isMe;

  Message({
    required this.sender,
    required this.text,
    required this.isMe,
  });
}

///navigation
///
class FadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  FadePageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
