import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frienivite_app/Core/Components/app_bar_widget.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';
import 'package:frienivite_app/view/calender/cal_event_detail_screen.dart';
import 'package:frienivite_app/view/calender/listviewItem.dart';
import 'package:frienivite_app/view_models/calendar_view_model/calender_provider.dart';
import 'package:provider/provider.dart';
import 'package:rename_app/constants.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  final DateTime _focusedDay =
      DateTime.now().add(Duration(days: 1)); // Set to 7 days before today
  DateTime? _selectedDay;
  CalendarController? _controller;

  final List<Event> _events = [
    Event(
      'Event 1',
      DateTime(2024, 6, 11, 10, 0),
      DateTime(2024, 6, 11, 12, 0),
    ),
    Event(
      'Event 2',
      DateTime(2024, 6, 12, 14, 0),
      DateTime(2024, 6, 12, 16, 0),
    ),
    Event(
      'Event 3',
      DateTime(2024, 6, 12, 17, 0),
      DateTime(2024, 6, 12, 19, 0),
    ),
  ];

  List<Event> _getEventsForDay(DateTime day) {
    return _events
        .where((event) =>
            event.startTime.year == day.year &&
            event.startTime.month == day.month &&
            event.startTime.day == day.day)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final calProvider = Provider.of<CalendarProvider>(context);
    return SingleChildScrollView(
      child: SizedBox(
        height: 1.sh,
        child: Column(
          children: [
            const HeaderOfCalenderScreen(),
            Column(
              children: [
                //header of this screen

                //custom header
                SizedBox(
                  width: 1.sw,
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
                      showDatePickerButton: true,
                      view: CalendarView.month,

                      dataSource: EventDataSource(_events),
                      monthViewSettings: const MonthViewSettings(
                        showAgenda: false,
                        appointmentDisplayMode:
                            MonthAppointmentDisplayMode.indicator,
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
                      onTap: (CalendarTapDetails details) {
                        if (details.targetElement ==
                                CalendarElement.calendarCell &&
                            details.date != null) {
                          calProvider.selectedDate = details.date!;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CalenderEventDetail(
                                isEventAccepted: true,
                                selectedDate: calProvider.selectedDate,
                                events: _getEventsForDay(details.date!),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                //
                VerticalSizedBox(vertical: 10.h),
                Row(
                  children: [
                    HorizontalSizedBox(horizontalSpace: 15.w),
                    CustomText(
                      text: "Upcoming Events",
                      fontSize: 20.sp,
                      color: blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                UpcomingEvents(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.builder(
        addAutomaticKeepAlives: false,
        padding: EdgeInsets.zero,
        // physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, item) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.eventdetail);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ShadowedContainer(
                title: "Moz festival 20.5.2023",
                imageUrl: cal1,
                address: "10:30 PM, Narry cafe, uk",
              ),
            ),
          );
        },
      ),
    );
  }
}

class HeaderOfCalenderScreen extends StatelessWidget {
  const HeaderOfCalenderScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 250.h,
      child: Container(
        color: const Color(0xffEDF6FF),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "TUESDAY, MAY 16",
                        fontSize: 13.sp,
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: "Today",
                            fontSize: 36.sp,
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    cal1,
                    width: 200.w,
                  ),
                ],
              ),
              VerticalSizedBox(vertical: 20.h)
            ],
          ),
        ),
      ),
    );
  }
}

class Event {
  final String title;
  final DateTime startTime;
  final DateTime endTime;

  Event(this.title, this.startTime, this.endTime);
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> source) {
    appointments = source;
  }
  @override
  DateTime getStartTime(int index) {
    return appointments![index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endTime;
  }

  @override
  String getSubject(int index) {
    return appointments![index].title;
  }

  @override
  Color getColor(int index) => baseColor;
}
