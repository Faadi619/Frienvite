import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:intl/intl.dart'; // Add this line to import the intl package

class DatePollEditEvent extends StatefulWidget {
  const DatePollEditEvent({super.key});

  @override
  State<DatePollEditEvent> createState() => _DatePollEditEventState();
}

class _DatePollEditEventState extends State<DatePollEditEvent> {
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
    log('==========================> In edit event through poll');
    final DateFormat formatter = DateFormat('dd/MM/yy');
    final DateFormat formatter2 = DateFormat('hh:mm a');
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          children: [
            Column(
              children: List.generate(_selectedDates.length, (index) {
                return Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 0.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: "Proposed Date & Time ${index + 1}",
                              fontSize: 15.sp,
                              color: greyColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        VerticalSizedBox(vertical: 10.h),
                        Row(
                          children: [
                            CustomText(
                              text: formatter.format(_selectedDates[index]),
                              fontSize: 17.sp,
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            HorizontalSizedBox(horizontalSpace: 10.w),
                            CustomText(
                              text: formatter2.format(_selectedendTimes[index]),
                              fontSize: 17.sp,
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                _selectedDates.removeAt(index);
                                _selectedendTimes.removeAt(index);
                                setState(() {});
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: blackColor,
                                size: 25.sp,
                              ),
                            ),
                            HorizontalSizedBox(horizontalSpace: 15.w),
                          ],
                        ),
                        VerticalSizedBox(vertical: 7.h),
                        const Divider(),
                        VerticalSizedBox(vertical: 10.h),
                      ],
                    ));
              }),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  _selectDateAndTime(context);
                },
                child: Container(
                  width: 180.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: baseColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.add,
                        color: baseColor,
                      ),
                      CustomText(
                        text: 'Proposed Date',
                        fontSize: 17.sp,
                        color: baseColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
