import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:intl/intl.dart';

class SingleDateEditWidget extends StatefulWidget {
  const SingleDateEditWidget({super.key});

  @override
  State<SingleDateEditWidget> createState() => _SingleDateEditWidgetState();
}

class _SingleDateEditWidgetState extends State<SingleDateEditWidget> {
  DateTime? _selectedStartDate = DateTime.now();
  DateTime? _selectedEndDate = DateTime.now();

  // start date
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedStartDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedStartDate) {
      setState(() {
        _selectedStartDate = picked;
      });
    }
  }

//End date
  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedEndDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedEndDate) {
      setState(() {
        _selectedEndDate = picked;
      });
    }
  }

  DateTime _selectedstartTime =
      DateTime.now(); // Variable to store selected time

  Future<void> _startTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedstartTime),
      builder: (BuildContext context, Widget? child) {
        return Theme(
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
        );
      },
    );
    if (picked != null) {
      setState(() {
        // Update selected time variable
        _selectedstartTime = DateTime(
          _selectedstartTime.year,
          _selectedstartTime.month,
          _selectedstartTime.day,
          picked.hour,
          picked.minute,
        );
        print(_selectedstartTime);
      });
    }
  }

  DateTime _selectedTime = DateTime.now(); // Variable to store selected time

  Future<void> _endTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedTime),
      builder: (BuildContext context, Widget? child) {
        return Theme(
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
        );
      }, // Initial time
    );
    if (picked != null) {
      setState(() {
        // Update selected time variable
        _selectedTime = DateTime(
          _selectedTime.year,
          _selectedTime.month,
          _selectedTime.day,
          picked.hour,
          picked.minute,
        );
        print(_selectedTime);
      });
    }
  }

  bool _isPublic = false;

  @override
  Widget build(BuildContext context) {
    log('==========================> In edit event through withould xxxxxx poll');

    final DateFormat formatter = DateFormat('dd/MM/yy');
    final DateFormat formatter2 = DateFormat('hh:mm a');
    return Column(
      children: [
        startDateAndTime(context, formatter, formatter2),
        //
        VerticalSizedBox(vertical: 20.h),
        //End Date And Time
        endDateAndTIME(context, formatter, formatter2),
      ],
    );
  }

  Row startDateAndTime(
      BuildContext context, DateFormat formatter, DateFormat formatter2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Start Date",
              fontSize: 15.sp,
              color: greyColor,
              fontWeight: FontWeight.w600,
            ),
            VerticalSizedBox(vertical: 10.h),
            GestureDetector(
              onTap: () => _selectStartDate(context),
              child: CustomText(
                text: _selectedStartDate == null
                    ? 'No date selected!'
                    : '${formatter.format(_selectedStartDate!)}',
                fontSize: 17.sp,
                color: blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            VerticalSizedBox(vertical: 15.h),
            Container(
              height: 1.h,
              width: 150.w,
              color: greyColor.withOpacity(0.5),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Start Time",
              fontSize: 15.sp,
              color: greyColor,
              fontWeight: FontWeight.w600,
            ),
            VerticalSizedBox(vertical: 10.h),
            GestureDetector(
              onTap: () => _startTime(context),
              child: CustomText(
                text: _startTime == null
                    ? 'No date selected!'
                    : '${formatter2.format(_selectedstartTime)}',
                fontSize: 17.sp,
                color: blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            VerticalSizedBox(vertical: 15.h),
            Container(
              height: 1.h,
              width: 150.w,
              color: greyColor.withOpacity(0.5),
            )
          ],
        ),
      ],
    );
  }

  Row endDateAndTIME(
      BuildContext context, DateFormat formatter, DateFormat formatter2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "End Date",
              fontSize: 15.sp,
              color: greyColor,
              fontWeight: FontWeight.w600,
            ),
            VerticalSizedBox(vertical: 10.h),
            GestureDetector(
              onTap: () => _selectEndDate(context),
              child: CustomText(
                text: _selectedStartDate == null
                    ? 'No date selected!'
                    : formatter.format(_selectedEndDate!),
                fontSize: 17.sp,
                color: blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            VerticalSizedBox(vertical: 15.h),
            Container(
              height: 1.h,
              width: 150.w,
              color: greyColor.withOpacity(0.5),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "End Time",
              fontSize: 15.sp,
              color: greyColor,
              fontWeight: FontWeight.w600,
            ),
            VerticalSizedBox(vertical: 10.h),
            GestureDetector(
              onTap: () => _endTime(context),
              child: CustomText(
                text: _startTime == null
                    ? 'No date selected!'
                    : '${formatter2.format(_selectedTime)}',
                fontSize: 17.sp,
                color: blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            VerticalSizedBox(vertical: 15.h),
            Container(
              height: 1.h,
              width: 150.w,
              color: greyColor.withOpacity(0.5),
            )
          ],
        ),
      ],
    );
  }
}
