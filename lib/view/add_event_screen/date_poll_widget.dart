import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/app_button.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/custom_textfiled1.dart';
import 'package:frienivite_app/Core/Components/description_widget.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';
import 'package:frienivite_app/view/PrivateEvents/invite_friends_bottomsheet.dart';
import 'package:frienivite_app/view/add_event_screen/single_date_widget_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DatePollWidget extends StatefulWidget {
  const DatePollWidget({
    super.key,
  });

  @override
  State<DatePollWidget> createState() => _DatePollWidgetState();
}

class _DatePollWidgetState extends State<DatePollWidget> {
  // DateTime? _selectedDate = DateTime.now();

//
// Corrected
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

// Variable to store selected time

  bool _isPublic = false;
  File? _image;
  imagepicker() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd/MM/yy');
    final DateFormat formatter2 = DateFormat('hh:mm a');
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          VerticalSizedBox(vertical: 25.h),
          _image != null
              ? GestureDetector(
                  onTap: imagepicker,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.file(
                            _image!,
                            height: 200.h,
                            width: 1.sw,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 35.w,
                        top: 15.h,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _image = null;
                            });
                          },
                          child: Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: pinkColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : GestureDetector(
                  onTap: imagepicker,
                  child: const UploadImage(),
                ),
          VerticalSizedBox(vertical: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const CustomTextField1(
              title: "Event Name",
              hintText: "Event Name",
            ),
          ),
          VerticalSizedBox(vertical: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const CustomTextField1(
              title: "Location",
              hintText: "Location of Event",
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
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
                                text:
                                    formatter2.format(_selectedendTimes[index]),
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
                                  Icons.delete,
                                  color: pinkColor,
                                  size: 20.sp,
                                ),
                              ),
                              HorizontalSizedBox(horizontalSpace: 15.w),
                            ],
                          ),
                          VerticalSizedBox(vertical: 7.h),
                          const Divider()
                        ],
                      ));
                }),
              ),
            ),
          ),
          VerticalSizedBox(vertical: 15.h),
          GestureDetector(
            onTap: () => _selectDateAndTime(context),
            child: const ProposedDate(),
          ),
          VerticalSizedBox(vertical: 25.h),
          const DescriptionWidget(),
          VerticalSizedBox(vertical: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Invite Friends",
                      fontSize: 17.sp,
                      color: blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                    VerticalSizedBox(vertical: 10.h),
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
                          builder: (context) =>
                              const InviteFriendsBottomSheeta(),
                        );
                      },
                      child: Container(
                        height: 42.h,
                        width: 42.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: baseColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(
                                  0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          VerticalSizedBox(vertical: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(title: "Create Event", onPressed: () {}),
          ),
          VerticalSizedBox(vertical: 20.h),
        ],
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CustomDescriptionField(
        title: "Description (Optional)",
        maxLines: 4,
        borderRadius: 20.r,
        hintText: "Event Description",
        borderColor: greyColor.withOpacity(0.5),
      ),
    );
  }
}

class ProposedDate extends StatelessWidget {
  const ProposedDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HorizontalSizedBox(horizontalSpace: 20.w),
        CustomContainer(
          borderColor: baseColor,
          borderRadius: 5.r,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add,
                  color: baseColor,
                ),
                HorizontalSizedBox(horizontalSpace: 5.w),
                CustomText(
                  text: "Date Option",
                  fontSize: 15.sp,
                  color: baseColor,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    super.key,
    required bool isPublic,
  }) : _isPublic = isPublic;

  final bool _isPublic;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 75.w,
      height: 32.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: _isPublic ? baseColor : Colors.grey,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 7.h,
            right: _isPublic ? 30.w : 8.w,
            child: CustomText(
              text: _isPublic ? "Public" : "Private",
              fontSize: 10.sp,
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.bounceIn,
            left: _isPublic ? 48.0 : 0.0,
            right: _isPublic ? 0.0 : 48.0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Padding(
                padding: EdgeInsets.all(3.sp),
                child: Container(
                  key: ValueKey<bool>(_isPublic),
                  width: 25.w,
                  height: 25.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
