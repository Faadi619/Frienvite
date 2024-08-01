import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';

class IndividualNotification {
  final String title;
  final DateTime date;
  final Widget icon;

  IndividualNotification(
      {required this.title, required this.date, required this.icon});
}

class NotificationList {
  final String timeTitle; // e.g., "Today", "Yesterday", or specific date
  final List<IndividualNotification> notifications;

  NotificationList({required this.timeTitle, required this.notifications});
}

class NotificationScreen extends StatelessWidget {
  final List<NotificationList> notificationLists = [
    NotificationList(
      timeTitle: "Today",
      notifications: [
        IndividualNotification(
          title: "New message from John",
          date: DateTime.now().subtract(Duration(hours: 2)),
          icon: Image.asset(
            done,
            height: 48.h,
            width: 48.w,
          ),
        ),
        IndividualNotification(
          title: "Meeting at 5 PM",
          date: DateTime.now().subtract(Duration(hours: 3)),
          icon: Image.asset(
            cross,
            height: 48.h,
            width: 48.w,
          ),
        ),
      ],
    ),
    NotificationList(
      timeTitle: "Yesterday",
      notifications: [
        IndividualNotification(
          title: "Package delivered",
          date: DateTime.now().subtract(Duration(days: 1, hours: 2)),
          icon: Image.asset(
            done,
            height: 48.h,
            width: 48.w,
          ),
        ),
        IndividualNotification(
          title: "Package delivered",
          date: DateTime.now().subtract(Duration(days: 1, hours: 2)),
          icon: Image.asset(
            message1,
            height: 48.h,
            width: 48.w,
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            if (details.velocity.pixelsPerSecond.dx > 5) {
              Navigator.pop(context);
            }
          },
          child: Container(
            height: 1.sh,
            color: Colors.transparent,
            child: Column(
              children: [
                VerticalSizedBox(vertical: 50.h),
                Row(
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
                    CustomText(
                      text: "Notifications",
                      fontSize: 24.sp,
                      color: blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                    const Icon(
                      Icons.arrow_back,
                      color: Colors.transparent,
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: notificationLists.length,
                    itemBuilder: (context, index) {
                      final notificationList = notificationLists[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (index != 0) VerticalSizedBox(vertical: 20.h),
                          if (index != 0)
                            Divider(
                              thickness: 3.sp,
                            ),
                          // Add divider between days
                          if (index != 0) VerticalSizedBox(vertical: 20.h),
                          Text(
                            notificationList.timeTitle,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: greyColor,
                            ),
                          ),

                          ...notificationList.notifications.map((notification) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: notification.icon,
                                  title: CustomText(
                                    text: notification.title,
                                    fontSize: 16.sp,
                                    color: blackColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  subtitle: CustomText(
                                    text: notification.title,
                                    fontSize: 14.sp,
                                    color: greyColor,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                notificationList.notifications.last !=
                                        notification
                                    ? const Divider(
                                        thickness: 1,
                                      )
                                    : Container(),
                                // if (index !=
                                //     notificationList.notifications.length - 1)
                                // const Divider(
                                //   thickness: 1,
                                // ),
                              ],
                            );
                          }).toList(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
