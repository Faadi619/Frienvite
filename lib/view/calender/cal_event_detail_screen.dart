import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/test.dart';
import 'package:frienivite_app/utils/routes/routes.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';
import 'package:frienivite_app/view/Event_Detail_Screen/event_detail_screen.dart';
import 'package:frienivite_app/view/calender/calender_screen.dart';
import 'package:frienivite_app/view/groups/Groups_Screen.dart';
import 'package:frienivite_app/view/notification_screen/notification_screen.dart';
import 'package:frienivite_app/view_models/calendar_view_model/calender_provider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderEventDetail extends StatefulWidget {
  DateTime selectedDate;
  final List<Event> events;
  final bool isEventAccepted;

  CalenderEventDetail(
      {required this.selectedDate,
      required this.events,
      required this.isEventAccepted});

  @override
  State<CalenderEventDetail> createState() => _CalenderEventDetailState();
}

class _CalenderEventDetailState extends State<CalenderEventDetail> {
  String formatDate(DateTime date) {
    // Define the format pattern
    final DateFormat formatter = DateFormat('EEEE, MMMM d');

    // Format the date according to the pattern
    return formatter.format(date).toUpperCase();
  }

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final calProvider = Provider.of<CalendarProvider>(context, listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: baseColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.addEvent);
        },
        child: const Icon(
          Icons.add,
          color: whiteColor,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250.h,
            child: Stack(
              children: [
                VerticalSizedBox(vertical: 20.h),
                Container(
                  color: const Color(0xffEDF6FF),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: Column(
                      children: [
                        VerticalSizedBox(vertical: 60.h),
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
                            Image.asset(
                              logo,
                              width: 140.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  FadePageRoute(
                                    page: NotificationScreen(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.notifications,
                                size: 30.sp,
                                color: baseColor,
                              ),
                            ),
                          ],
                        ),
                        VerticalSizedBox(vertical: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Consumer<CalendarProvider>(
                                    builder: (context, model, child) {
                                  return CustomText(
                                    text: formatDate(model.selectedDate),
                                    fontSize: 19.sp,
                                    color: greyColor,
                                    fontWeight: FontWeight.w600,
                                  );
                                }),
                              ],
                            ),
                            Image.asset(
                              cal1,
                              width: 140.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Theme(
              data: ThemeData(
                useMaterial3: false,
                colorScheme: ColorScheme.fromSeed(
                  // onBackground: baseColor, // Background color
                  onPrimary: whiteColor,
                  seedColor: whiteColor,
                  secondaryContainer: baseColor,
                  secondary: baseColor,
                  surfaceTint: whiteColor,
                  primary: baseColor,
                  onSecondary: whiteColor,
                ),
              ),
              child: SfCalendar(
                onViewChanged: (viewChangedDetails) {
                  if (viewChangedDetails.visibleDates.isNotEmpty) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      calProvider
                          .selectDateFunc(viewChangedDetails.visibleDates[0]);
                    });
                  }
                },
                showDatePickerButton: true,
                initialDisplayDate: widget.selectedDate,
                todayHighlightColor: baseColor,
                appointmentBuilder: (context, calendarAppointmentDetails) =>
                    GestureDetector(
                  onTap: () {
                    Get.to(() => EventDetailScreen());
                  },
                  child: Container(
                    color: widget.isEventAccepted
                        ? baseColor
                        : baseColor.withOpacity(0.5),
                    child: Padding(
                      padding: EdgeInsets.all(6.r),
                      child: Row(
                        children: [
                          Image.asset(
                            p1,
                            height: 67.h,
                            width: 67.w,
                          ),
                          HorizontalSizedBox(horizontalSpace: 10.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Friends Forever Party",
                                fontSize: 16,
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                              CustomText(
                                text: "Tuesday, 12:00AM - 3:00AM",
                                fontSize: 12,
                                color: whiteColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                dataSource: EventDataSource(widget.events),
                timeSlotViewSettings: const TimeSlotViewSettings(
                  startHour: 0,
                  endHour: 24,
                ),
                monthViewSettings: const MonthViewSettings(
                  showAgenda: false,
                ),
                headerStyle: CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  backgroundColor: whiteColor,
                  textStyle: TextStyle(
                    fontSize: 18.sp,
                    color: greyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                todayTextStyle: TextStyle(
                  color: whiteColor,
                  fontSize: 15.sp,
                ),

                showNavigationArrow: true,
                cellBorderColor: Colors.transparent, // Removes borders
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventStrip extends StatelessWidget {
  final Event event;

  EventStrip({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: blackColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            event.title,
            style: TextStyle(
              fontSize: 16.0,
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${TimeOfDay.fromDateTime(event.startTime).format(context)} - ${TimeOfDay.fromDateTime(event.endTime).format(context)}',
            style: TextStyle(fontSize: 16.0, color: whiteColor),
          ),
        ],
      ),
    );
  }
}
///custome header for syncfussion
///
