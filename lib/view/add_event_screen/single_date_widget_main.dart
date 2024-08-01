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
import 'package:frienivite_app/view/PrivateEvents/SeeAllInvitations/see_all_invitations.dart';
import 'package:frienivite_app/view/PrivateEvents/invite_friends_bottomsheet.dart';
import 'package:frienivite_app/view/add_event_screen/categories_bottomsheet.dart';
import 'package:frienivite_app/view/add_event_screen/provider/list_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SingleDateWidget extends StatefulWidget {
  const SingleDateWidget({
    super.key,
  });

  @override
  State<SingleDateWidget> createState() => _SingleDateWidgetState();
}

class _SingleDateWidgetState extends State<SingleDateWidget> {
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

  Category? selectedCategory =
      Category(name: 'Select Category', icon: Icons.search);
  List<Category> categories = [
    Category(name: 'Education', icon: Icons.business),
    Category(name: 'Festival', icon: Icons.palette),
    Category(name: 'Theatre & movie', icon: Icons.theaters),
    Category(name: 'Market & shopping', icon: Icons.shopping_cart),
    Category(name: 'Games & entertainment', icon: Icons.videogame_asset),
    Category(name: 'Family & kids', icon: Icons.family_restroom),
    Category(name: 'Party & nightlife', icon: Icons.nightlife),
    Category(name: 'Sports & e-Sports', icon: Icons.sports_esports),
    Category(name: 'Charity & volunteering', icon: Icons.volunteer_activism),
    Category(name: 'Holiday events', icon: Icons.event),
    Category(name: 'Concert & music', icon: Icons.music_note),
    Category(name: 'Food & beverage', icon: Icons.fastfood),
    Category(name: 'Private Event', icon: Icons.lock),
    Category(name: 'Social & dating', icon: Icons.people),
    Category(name: 'Festival', icon: Icons.festival),
    Category(name: 'Conference & corporate', icon: Icons.school),
    Category(name: 'Other', icon: Icons.school),
  ];

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
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedstartTime),
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
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedTime),
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
  var firstIndex;
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd/MM/yy');
    final DateFormat formatter2 = DateFormat('hh:mm a');
    final indexProvider = Provider.of<ListIndexProvider>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          VerticalSizedBox(vertical: 25.h),
          _image != null
              ? GestureDetector(
                  onTap: imagepicker,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.file(
                            _image!,
                            height: 200.h,
                            width: 1.sw,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
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
          VerticalSizedBox(vertical: 20.h),
          //Start Date and Time Row
          startDateAndTime(context, formatter, formatter2),
          VerticalSizedBox(vertical: 20.h),
          //End Date And Time
          endDateAndTIME(context, formatter, formatter2),
          VerticalSizedBox(vertical: 20.h),
          //Description
          const DescriptionWidget(),
          //
          VerticalSizedBox(vertical: 20.h),
          Row(
            children: [
              HorizontalSizedBox(horizontalSpace: 20.w),
              CustomText(
                text: "Select Category",
                fontSize: 15.sp,
                color: blackColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          VerticalSizedBox(vertical: 12.h),
          GestureDetector(
            onTap: () {
              setState(() {});
              showCategoryModal(context, categories, (category) {
                // Handle the selected category here
                selectedCategory = category;
                print('Selected category: ${selectedCategory!.name}');
              });
            },
            child: Container(
              height: 60.h,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              // color: blackColor,
              decoration: BoxDecoration(
                border: Border.all(color: blackColor),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  HorizontalSizedBox(horizontalSpace: 10.w),
                  Icon(
                    selectedCategory!.icon,
                    size: 20.sp,
                    // color: selectedCategory == value ? baseColor : blackColor,
                  ),
                  HorizontalSizedBox(horizontalSpace: 20.w),
                  CustomText(
                    text: selectedCategory!.name,
                    fontSize: 16.sp,
                    color: blackColor,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
            ),
          ),
          VerticalSizedBox(vertical: 12.h),
          VerticalSizedBox(vertical: 20.h),
          //InviteFriends Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const InviteFriends(),
                switchButton(),
              ],
            ),
          ),
          //
          VerticalSizedBox(vertical: 20.h),
          //
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(title: "Create Event", onPressed: () {}),
          ),
          //
          VerticalSizedBox(vertical: 20.h),
        ],
      ),
    );
  }

  void showCategoryModal(BuildContext context, List<Category> categories,
      ValueChanged<Category> onSelected) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Category',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                ...categories.map((Category category) {
                  return ListTile(
                    leading: Icon(
                      category.icon,
                      color: baseColor,
                    ),
                    title: Text(category.name),
                    onTap: () {
                      setState(() {});
                      onSelected(
                          category); // Callback to handle category selection
                      Navigator.pop(context); // Close the modal
                    },
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }

  GestureDetector switchButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPublic = !_isPublic;
        });
      },
      child: AnimatedContainer(
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
              top: 9.h,
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
              left: _isPublic ? 48.w : 0.w,
              right: _isPublic ? 0.w : 48.w,
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
      ),
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
                    : '${formatter.format(_selectedEndDate!)}',
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
}

class UploadImage extends StatelessWidget {
  const UploadImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: CustomContainer(
        height: 200.h,
        width: 1.sw,
        borderRadius: 20.r,
        borderColor: greyColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.file_upload_outlined,
              size: 40.sp,
              color: greyColor,
            ),
            CustomText(
              text: "Upload image",
              fontSize: 16.sp,
              color: greyColor,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}

class InviteFriends extends StatelessWidget {
  const InviteFriends({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (context) => const InviteFriendsBottomSheeta(),
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
                  offset: const Offset(0, 4), // changes position of shadow
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
        )
      ],
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
        hintText: "Event Description",
        maxLines: 4,
        borderRadius: 20.r,
        borderColor: greyColor.withOpacity(0.5),
      ),
    );
  }
}
