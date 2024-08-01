import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/Core/multiproviders_list/previous_page.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';
import 'package:frienivite_app/view/Event_Detail_Screen/view_people_going_bottom_sheet.dart';
import 'package:frienivite_app/view/PrivateEvents/invite_friends_bottomsheet.dart';
import 'package:frienivite_app/view/add_event_screen/share_app_bottomsheet.dart';
import 'package:frienivite_app/view/groups/Groups_Screen.dart';
import 'package:frienivite_app/view/groups/chat_header.dart';
import 'package:frienivite_app/view/groups/chat_screen.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';

class EventDetailScreen extends StatefulWidget {
  const EventDetailScreen({super.key, this.image, this.title});
  final String? image;
  final String? title;

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    final navigationProvider =
        Provider.of<NavigationProvider>(context, listen: true);
    log('this is the enum =========================================> ${navigationProvider.previousPage}');
    return Scaffold(
      //>>>>>>>>>>>>
      //Bottom sheet
      //>>>>>>>>>>>>
      bottomSheet: navigationProvider.previousPage == otherPolls
          ? Container(
              color: whiteColor,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: const PollButtonWidget(),
              ),
            )
          : navigationProvider.previousPage == frominvitation
              ? Container(
                  color: whiteColor,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: const InviteScreenButotnWidget()),
                )
              : Container(
                  color: whiteColor,
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: FooterWidgetEventDetailScreen(
                    navigationProvider: navigationProvider,
                  ),
                ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //upper section of the screen
            UpperSectionEventDetailScreen(
              image: widget.image,
            ),
            //lower section of the screen
            VerticalSizedBox(vertical: 30.h),
            Padding(
              padding: EdgeInsets.only(left: 15.sp),
              child: CustomText(
                text: widget.title ?? "International Band Music Concert",
                fontSize: 33.sp,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
                color: blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            VerticalSizedBox(vertical: 15.h),
            //TODO: Make it multiple selection for the other polls and single selection for myEvent Poll
            navigationProvider.previousPage == myPoll ||
                    navigationProvider.previousPage == otherPolls
                ? PollScreenWidget(
                    multipleSelection:
                        navigationProvider.previousPage != myPoll,
                  )
                : const CalenderWidget(),
            VerticalSizedBox(vertical: 25.h),

            const LocationWidget(),
            VerticalSizedBox(vertical: 25.h),
            Row(
              children: [
                HorizontalSizedBox(horizontalSpace: 20.w),
                CustomText(
                  text: "About Event",
                  fontSize: 18.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            VerticalSizedBox(vertical: 10.h),
            DescriptionEventDetailScreen(),
            VerticalSizedBox(vertical: 100.h),

            // navigationProvider.previousPage == frompolls ||
          ],
        ),
      ),
    );
  }
}

class InviteScreenButotnWidget extends StatelessWidget {
  const InviteScreenButotnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomContainer(
            backgroundColor: whiteColor,
            borderColor: baseColor,
            borderRadius: 12.r,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 55.w,
                vertical: 12.sp,
              ),
              child: CustomText(
                text: "Reject",
                fontSize: 16.sp,
                color: baseColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          CustomContainer(
            backgroundColor: baseColor,
            borderRadius: 12.r,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 55.w,
                vertical: 12.sp,
              ),
              child: CustomText(
                text: "Accept",
                fontSize: 16.sp,
                color: whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PollButtonWidget extends StatelessWidget {
  const PollButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomContainer(
            shadow: true,
            backgroundColor: baseColor,
            borderRadius: 15.r,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.h,
              ),
              child: Icon(
                Icons.message,
                color: whiteColor,
                size: 35.sp,
              ),
            ),
          ),
          HorizontalSizedBox(horizontalSpace: 15.w),
          CustomContainer(
            shadow: true,
            borderColor: baseColor,
            backgroundColor: whiteColor,
            borderRadius: 8.r,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 110.w,
                vertical: 15.h,
              ),
              child: CustomText(
                text: "Reject",
                fontSize: 16.sp,
                color: baseColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PollScreenWidget extends StatefulWidget {
  bool multipleSelection = false;

  PollScreenWidget({super.key, required this.multipleSelection});

  int _selectedIndex = -1;

  @override
  State<PollScreenWidget> createState() => _PollScreenWidgetState();
}

class _PollScreenWidgetState extends State<PollScreenWidget> {
  List<int> selectedIndices = [];

  void handleSelectionChanged(List<int> updatedIndices) {
    setState(() {
      selectedIndices = updatedIndices;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initially, no option is selected

    return Column(
      children: [
        Row(
          children: [
            HorizontalSizedBox(horizontalSpace: 15.w),
            CustomText(
              text: "Votes For Event Date",
              fontSize: 17.sp,
              color: baseColor,
              fontWeight: FontWeight.w700,
            ),
            CustomText(
              text: "  (Tuesday, 4:00PM - 9:00PM)",
              fontSize: 12.sp,
              color: greyColor,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        VerticalSizedBox(vertical: 15.h),
        if (widget.multipleSelection)
          ListView.builder(
            shrinkWrap: true,
            itemCount: votes.length, // Assuming 3 options
            itemBuilder: (context, index) {
              return MultipleSelectionPollWidget(
                index: index,
                selectedIndices: selectedIndices,
                onChanged: handleSelectionChanged,
              );
            },
          )
        else
          Column(
            children: List.generate(votes.length, (index) {
              return VoteItem(
                index: index,
                selectedIndex: widget._selectedIndex,
                onChanged: (int value) {
                  setState(() {
                    widget._selectedIndex = value;
                  });
                },
              );
            }),
          )
      ],
    );
  }
}

class MultipleSelectionPollWidget extends StatefulWidget {
  final int index;
  final List<int> selectedIndices;
  final ValueChanged<List<int>> onChanged;

  MultipleSelectionPollWidget({
    super.key,
    required this.index,
    required this.selectedIndices,
    required this.onChanged,
  });

  @override
  State<MultipleSelectionPollWidget> createState() =>
      _MultipleSelectionPollWidgetState();
}

class _MultipleSelectionPollWidgetState
    extends State<MultipleSelectionPollWidget> {
  List<double> votes = [1, 5, 1];

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: baseColor,
      title: Row(
        children: [
          Text(
            "14 December, 2024",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10.0),
          Stack(
            children: [
              Container(
                height: 7.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: lightGrey,
                ),
              ),
              Container(
                height: 7.0,
                width: 2.0 * votes[widget.index],
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: baseColor,
                ),
              ),
            ],
          ),
          SizedBox(width: 10.0),
          Text(
            votes[widget.index].toString(),
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      value: widget.selectedIndices.contains(widget.index),
      onChanged: (bool? value) {
        setState(() {
          if (value == true) {
            widget.selectedIndices.add(widget.index);
          } else {
            widget.selectedIndices.remove(widget.index);
          }
        });
        widget.onChanged(widget.selectedIndices);
      },
    );
  }
}

class VoteItem extends StatefulWidget {
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  VoteItem({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  State<VoteItem> createState() => _VoteItemState();
}

List<double> votes = [1, 5, 1];

class _VoteItemState extends State<VoteItem> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile<int>(
      fillColor: WidgetStateProperty.all(baseColor),
      title: Row(
        children: [
          Text(
            "14 December, 2024",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10.0),
          Stack(
            children: [
              Container(
                height: 7.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: lightGrey,
                ),
              ),
              Container(
                height: 7.0,
                width: 2.0 * votes[widget.index],
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: baseColor,
                ),
              ),
            ],
          ),
          SizedBox(width: 10.0),
          Text(
            votes[widget.index].toString(),
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      value: widget.index,
      groupValue: widget.selectedIndex,
      onChanged: (int? value) {
        widget.onChanged(value!);
      },
      activeColor: Colors.blue,
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomContainer(
            borderRadius: 8.r,
            backgroundColor: baseColor.withOpacity(0.1),
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: Icon(
                Icons.location_pin,
                color: baseColor,
                size: 25.sp,
              ),
            ),
          ),
          HorizontalSizedBox(horizontalSpace: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Gala Convention Center",
                fontSize: 16.sp,
                color: blackColor,
                fontWeight: FontWeight.w500,
              ),
              VerticalSizedBox(vertical: 8.h),
              CustomText(
                text: "36 Guild Street London, UK ",
                fontSize: 12.sp,
                color: greyColor,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DescriptionEventDetailScreen extends StatelessWidget {
  const DescriptionEventDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HorizontalSizedBox(horizontalSpace: 20.w),
        SizedBox(
          width: 0.8.sw,
          child: CustomText(
            text: "Enjoy your favorite dishe and a lovely your friends"
                "and family and have a great time. Food from local food "
                "trucks will be available for purchase. amily and have a "
                "great time. Food from local food trucks will be available "
                "for purchase. ",
            fontSize: 16.sp,
            color: blackColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class FooterWidgetEventDetailScreen extends StatefulWidget {
  const FooterWidgetEventDetailScreen({
    super.key,
    required this.navigationProvider,
  });

  final NavigationProvider navigationProvider;

  @override
  State<FooterWidgetEventDetailScreen> createState() =>
      _FooterWidgetEventDetailScreenState();
}

class _FooterWidgetEventDetailScreenState
    extends State<FooterWidgetEventDetailScreen> {
  final TextEditingController messageController = TextEditingController();
  bool isNotified = true;
  final List<DateTime> _selectedDates = [
    DateTime.now(),
  ];
  final List<DateTime> _selectedendTimes = [
    DateTime.now(),
  ];
  DateTime _selectedTime = DateTime.now();

  // start date
  Future<void> _selectDateAndTime(BuildContext context) async {
    print(_selectedDates);
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
                alwaysUse24HourFormat:
                    false), // Set to false to use 12-hour format
            child: Theme(
              data: ThemeData(
                colorScheme: const ColorScheme.light(
                  inversePrimary: baseColor,
                  onSecondaryContainer: whiteColor,
                  surfaceTint: whiteColor,
                  primaryContainer: baseColor,
                  onPrimaryContainer: whiteColor,
                  onPrimary: whiteColor,
                  secondaryContainer: baseColor,
                  secondary: baseColor,
                  primary: baseColor,
                  onSecondary: whiteColor,
                  // Color for text and icons on surface color
                ),
                dialogBackgroundColor:
                    Colors.white, // Background color of the dialog
              ),
              child: child!,
            ),
          );
        },
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedTime),
      );

      if (pickedTime != null) {
        setState(() {
          // Combine pickedDate and pickedTime into a single DateTime
          _selectedTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          _selectedendTimes.add(_selectedTime);
          _selectedDates.add(pickedDate);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.navigationProvider.previousPage == upcomingevent ||
                  widget.navigationProvider.previousPage == nearbyevent
              ? const SizedBox()
              : CustomContainer(
                  shadow: true,
                  backgroundColor: baseColor,
                  borderRadius: 15.r,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          widget.navigationProvider.previousPage == myPoll
                              ? 7.w
                              : 15.w,
                      vertical: 10.h,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Utils.successflushbarMessage(
                          'Notificatins Sent to All',
                          context,
                        );
                      },
                      child: Icon(
                        Icons.notifications_active,
                        color: whiteColor,
                        size: 35.sp,
                      ),
                    ),
                  ),
                ),
          HorizontalSizedBox(
            horizontalSpace:
                widget.navigationProvider.previousPage == myPoll ? 7.w : 15.w,
          ),
          widget.navigationProvider.previousPage == nearbyevent
              ? const SizedBox()
              : CustomContainer(
                  shadow: true,
                  backgroundColor: baseColor,
                  borderRadius: 15.r,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            widget.navigationProvider.previousPage == myPoll
                                ? 7.w
                                : 15.w,
                        vertical: 10.h),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => ChatScreen(
                              group: Group(
                                name: "Group 1",
                                messages: [
                                  Message(
                                      sender: "User1",
                                      text: "Hello!",
                                      isMe: false),
                                  Message(
                                      sender: "Me",
                                      text: "Hi there!",
                                      isMe: true),
                                ],
                              ),
                            ));
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return AlertDialog(
                        //       content: TextField(
                        //         controller: messageController,
                        //         minLines: 1,
                        //         maxLines: 3,
                        //         decoration: const InputDecoration(
                        //             hintText: 'Type something...'),
                        //       ),
                        //       actions: [
                        //         TextButton(
                        //           onPressed: () {
                        //             messageController.clear();
                        //             Navigator.of(context).pop();
                        //           },
                        //           child: const Text('Cancel'),
                        //         ),
                        //         ElevatedButton(
                        //           onPressed: () {
                        //             print(
                        //                 'Send button pressed, text: ${messageController.text}');
                        //             Navigator.of(context).pop();
                        //           },
                        //           child: const Text('Send'),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // );
                      },
                      child: Icon(
                        Icons.message,
                        color: whiteColor,
                        size: 35.sp,
                      ),
                    ),
                  ),
                ),
          HorizontalSizedBox(
            horizontalSpace:
                widget.navigationProvider.previousPage == myPoll ? 7.w : 15.w,
          ),
          GestureDetector(
            onTap: () {
              log('this is the enum for dialogue box =====> ${widget.navigationProvider.previousPage.toString()}');
              if (widget.navigationProvider.previousPage == nearbyevent) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return MyDialougeBoxWidget(
                      title: "Are you sure you want to join this event?",
                      context: context,
                      // description: "Are you sure you want to continue this? "
                      //     "If you continue it, You will not be able to change it",
                    );
                  },
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return MyDialougeBoxWidget(
                      title: "Are you sure you want to cancel this event?",
                      context: context,
                      description: "Are you sure you want to continue this? "
                          "If you continue it, You will not be able to change it",
                    );
                  },
                );
              }
            },
            child: CustomContainer(
              shadow: true,
              backgroundColor:
                  widget.navigationProvider.previousPage == nearbyevent
                      ? baseColor
                      : pinkColor,
              borderRadius: 15.r,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.navigationProvider.previousPage ==
                              upcomingevent ||
                          widget.navigationProvider.previousPage == nearbyevent
                      ? 120.w
                      : widget.navigationProvider.previousPage == myPoll
                          ? 7.w
                          : 30.w,
                  vertical: 15.h,
                ),
                child: CustomText(
                  text: widget.navigationProvider.previousPage == upcomingevent
                      ? "Decline"
                      : widget.navigationProvider.previousPage == nearbyevent
                          ? "Join"
                          : "Cancel Event",
                  fontSize: 16.sp,
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          HorizontalSizedBox(horizontalSpace: 10.w),
          widget.navigationProvider.previousPage == myPoll
              ? GestureDetector(
                  onTap: () {
                    // _selectDateAndTime(context);
                    Utils.successflushbarMessage(
                        'Date Set Successfully', context);
                  },
                  child: CustomContainer(
                    backgroundColor: baseColor,
                    borderRadius: 12.r,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 15.h),
                      child: CustomText(
                        text: "Set Date",
                        fontSize: 16.sp,
                        color: whiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({
    super.key,
  });

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final navigationProvider =
        Provider.of<NavigationProvider>(context, listen: true);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomContainer(
            borderRadius: 8.r,
            backgroundColor: baseColor.withOpacity(0.1),
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: Icon(
                Icons.calendar_month,
                color: baseColor,
                size: 25.sp,
              ),
            ),
          ),
          HorizontalSizedBox(horizontalSpace: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "14 December, 2021",
                fontSize: 16.sp,
                color: blackColor,
                fontWeight: FontWeight.w500,
              ),
              VerticalSizedBox(vertical: 8.h),
              CustomText(
                text: "Tuesday, 4:00PM - 9:00PM",
                fontSize: 12.sp,
                color: greyColor,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const Spacer(),
          if (navigationProvider.previousPage != nearbyevent)
            GestureDetector(
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              child: CustomContainer(
                borderRadius: 12.r,
                backgroundColor: baseColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: isChecked == false ? "Added" : "Add to calendar",
                    fontSize: 10.sp,
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class UpperSectionEventDetailScreen extends StatelessWidget {
  const UpperSectionEventDetailScreen({
    super.key,
    this.image,
  });
  final String? image;

  @override
  Widget build(BuildContext context) {
    final navigationProvider =
        Provider.of<NavigationProvider>(context, listen: true);
    return SizedBox(
      height: 260.h,
      child: Stack(
        children: [
          Container(
            height: 230.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: blackColor,
              image: DecorationImage(
                image: AssetImage(image ?? event2),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                VerticalSizedBox(vertical: 45.h),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back, color: whiteColor),
                      ),
                      SizedBox(width: 10.sp),
                      CustomText(
                        text: "Event Details",
                        fontSize: 24.sp,
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      navigationProvider.previousPage == nearbyevent ||
                              navigationProvider.previousPage ==
                                  upcomingevent ||
                              navigationProvider.previousPage == otherPolls ||
                              navigationProvider.previousPage == frominvitation
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutesName.editevent);
                              },
                              child: EventDetailScreenCustomWidget(
                                  icon: Icons.edit),
                            ),
                      SizedBox(width: 10.sp),
                      GestureDetector(
                        onTap: () {
                          showMaterialModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return const ShareBottomSheet();
                            },
                          );
                        },
                        child: EventDetailScreenCustomWidget(
                            icon: FontAwesomeIcons.share),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const StackedContainer(),
        ],
      ),
    );
  }
}

class StackedContainer extends StatelessWidget {
  const StackedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigationProvider =
        Provider.of<NavigationProvider>(context, listen: false);
    return Positioned(
      bottom: 5.h,
      left: 40.w,
      right: 40.w,
      child: CustomContainer(
        shadow: true,
        borderRadius: 40.r,
        height: 65.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  showMaterialModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.r),
                      ),
                    ),
                    context: context,
                    builder: (context) => const ViewPeopleBottomSheet(),
                  );
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 100.w,
                      child: Stack(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              p1,
                              height: 45.h,
                              width: 45.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 20.w,
                            child: ClipOval(
                              child: Image.asset(
                                p1,
                                height: 45.h,
                                width: 45.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 40.w,
                            child: ClipOval(
                              child: Image.asset(
                                p1,
                                height: 45.h,
                                width: 45.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomText(
                      text: navigationProvider.previousPage == nearbyevent
                          ? "+20 invited"
                          : "+20 going",
                      fontSize: 15.sp,
                      color: baseColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              navigationProvider.previousPage == upcomingevent ||
                      navigationProvider.previousPage == otherPolls
                  ? const SizedBox()
                  : CustomContainer(
                      backgroundColor: baseColor,
                      borderRadius: 7.r,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 5.h,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showMaterialModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(20.r),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return const InviteFriendsBottomSheeta();
                              },
                            );
                          },
                          child: CustomText(
                            text: navigationProvider.previousPage == nearbyevent
                                ? "Invite"
                                : "Add",
                            fontSize: 15.sp,
                            color: whiteColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class EventDetailScreenCustomWidget extends StatelessWidget {
  IconData icon;
  EventDetailScreenCustomWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: whiteColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(5.sp),
        child: Icon(
          icon,
          color: blackColor,
        ),
      ),
    );
  }
}
