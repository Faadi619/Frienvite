import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/Components/textfield_container.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/view/PrivateEvents/private_event_screen.dart';
import 'package:frienivite_app/view/friendsSection/friends_section.dart';
import 'package:frienivite_app/view/groups/chat_header.dart';
import 'package:intl/intl.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  DateTime? _selectedTime;

  // start date
  DateTime? _selectedStartDate = DateTime.now();

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

  Category? selectedCategory =
      Category(name: 'Select Category', icon: Icons.search);

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

  List<Category> categories = [
    Category(name: 'Food & beverage', icon: Icons.fastfood),
    Category(name: 'Private Event', icon: Icons.lock),
    Category(name: 'Social & dating', icon: Icons.people),
    Category(name: 'Festival', icon: Icons.festival),
    Category(name: 'Education', icon: Icons.school),
    Category(name: 'Conference & corporate', icon: Icons.business),
    Category(name: 'Art & culture', icon: Icons.palette),
    Category(name: 'Theatre & movie', icon: Icons.theaters),
    Category(name: 'Market & shopping', icon: Icons.shopping_cart),
    Category(name: 'Games & entertainment', icon: Icons.videogame_asset),
    Category(name: 'Family & kids', icon: Icons.family_restroom),
    Category(name: 'Party & nightlife', icon: Icons.nightlife),
    Category(name: 'Sports & e-Sports', icon: Icons.sports_esports),
    Category(name: 'Charity & volunteering', icon: Icons.volunteer_activism),
    Category(name: 'Holiday events', icon: Icons.event),
    Category(name: 'Concert & music', icon: Icons.music_note),
  ];
  List<String> dates = [
    "Today",
    "Tomorrow",
    "This week",
  ];
  int selected = -1;
  int _selectedCategory = -1;
  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd/MM/yy');
    return SizedBox(
      height: 0.70.sh,
      child: Column(
        children: [
          VerticalSizedBox(vertical: 15.h),
          CustomContainer(
            height: 3.h,
            width: 20.w,
            backgroundColor: lightGrey,
            borderRadius: 20.r,
          ),
          VerticalSizedBox(vertical: 10.h),
          CustomText(
            text: "Filter",
            fontSize: 24.sp,
            color: blackColor,
            fontWeight: FontWeight.w500,
          ),
          VerticalSizedBox(vertical: 10.h),
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
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20.w),
          //   child: CustomContainer(
          //     width: 1.sw,
          //     height: 50,
          //     child: DropdownButtonFormField<Category>(
          //       iconEnabledColor: baseColor,
          //       decoration: InputDecoration(
          //         contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(12.r),
          //           borderSide: const BorderSide(
          //             color: baseColor,
          //           ),
          //         ),
          //       ),
          //       alignment: AlignmentDirectional.centerStart,
          //       // Step 3: Use `DropdownButton` Widget
          //       value: selectedCategory,
          //       hint: Text("Select Category"),
          //       onChanged: (Category? newValue) {
          //         // Step 5: Update the selected category
          //         setState(() {
          //           selectedCategory = newValue!;
          //         });
          //       },
          //       items: categories
          //           .map<DropdownMenuItem<Category>>((Category value) {
          //         // Step 4: Populate `DropdownButton` with items
          //         return DropdownMenuItem<Category>(
          //           value: value,
          //           child: Row(
          //             children: [
          //               HorizontalSizedBox(horizontalSpace: 10.w),
          //               Icon(
          //                 value.icon,
          //                 size: 20.sp,
          //                 color: selectedCategory == value
          //                     ? baseColor
          //                     : blackColor,
          //               ),
          //               HorizontalSizedBox(horizontalSpace: 20.w),
          //               CustomText(
          //                 text: value.name,
          //                 fontSize: 16.sp,
          //                 color: blackColor,
          //                 fontWeight: FontWeight.w400,
          //               )
          //             ],
          //           ),
          //         );
          //       }).toList(),
          //     ),
          //   ),
          // ),
          VerticalSizedBox(vertical: 10.h),
          Row(
            children: [
              HorizontalSizedBox(horizontalSpace: 20.w),
              CustomText(
                text: "Time & Date",
                fontSize: 16.sp,
                color: blackColor,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(
            height: 60.h,
            child: ListView.builder(
              itemCount: dates.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                  child: GestureDetector(
                    onTap: () {
                      print("opopopopopppopopopp");
                      if (selected == index) {
                        setState(() {
                          selected = -1;
                        });
                      } else {
                        setState(() {
                          selected = index;
                        });
                      }
                    },
                    child: CustomContainer(
                      borderColor: greyColor.withOpacity(0.4),
                      backgroundColor:
                          selected == index ? baseColor : whiteColor,
                      borderRadius: 12.r,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 5.h),
                          child: CustomText(
                            text: dates[index],
                            fontSize: 15.sp,
                            color: selected == index
                                ? whiteColor
                                : const Color(0xff807A7A),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          VerticalSizedBox(vertical: 20.h),
          Row(
            children: [
              HorizontalSizedBox(horizontalSpace: 10.w),
              CustomContainer(
                width: 300.w,
                borderColor: lightGrey.withOpacity(0.7),
                borderRadius: 12.r,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: baseColor,
                        size: 25.sp,
                      ),
                      HorizontalSizedBox(horizontalSpace: 18.w),
                      GestureDetector(
                        onTap: () => _selectStartDate(context),
                        child: CustomText(
                          text: 'Choose from calender',
                          fontSize: 15.sp,
                          color: greyColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      HorizontalSizedBox(horizontalSpace: 18.w),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: baseColor,
                        size: 22.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          VerticalSizedBox(vertical: 15.h),
          Row(
            children: [
              HorizontalSizedBox(horizontalSpace: 20.w),
              CustomText(
                text: "Location",
                fontSize: 16.sp,
                color: blackColor,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          VerticalSizedBox(vertical: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: CustomContainer(
              borderColor: lightGrey.withOpacity(0.7),
              borderRadius: 12.r,
              child: Row(
                children: [
                  HorizontalSizedBox(horizontalSpace: 7.w),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      location,
                      height: 50.h,
                    ),
                  ),
                  HorizontalSizedBox(horizontalSpace: 10.w),
                  CustomText(
                    text: "New Yourk, USA",
                    fontSize: 16.sp,
                    color: blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: baseColor,
                  ),
                  HorizontalSizedBox(horizontalSpace: 20.w),
                ],
              ),
            ),
          ),
          VerticalSizedBox(vertical: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  selected = -1;
                  _selectedCategory = -1;
                  setState(() {});
                },
                child: CustomContainer(
                  borderColor: greyColor.withOpacity(0.2),
                  borderRadius: 12.r,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                    child: CustomText(
                      text: "RESET",
                      fontSize: 16.sp,
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              HorizontalSizedBox(horizontalSpace: 20.w),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CustomContainer(
                  borderColor: baseColor,
                  borderRadius: 12.r,
                  backgroundColor: baseColor,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                    child: CustomText(
                      text: "APPLY",
                      fontSize: 16.sp,
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
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
  UserModal(
      name: "John Doe",
      profilePicture: "assets/john_doe.jpg",
      isSelected: false),
  UserModal(
      name: "Jane Smith",
      profilePicture: "assets/jane_smith.jpg",
      isSelected: false),
  UserModal(
    name: "Alice Johnson",
    profilePicture: "assets/alice_johnson.jpg",
    isSelected: false,
  ),
  UserModal(
    name: "Alice Johnson",
    profilePicture: "assets/alice_johnson.jpg",
    isSelected: false,
  ),
  UserModal(
    name: "Alice Johnson",
    profilePicture: "assets/alice_johnson.jpg",
    isSelected: false,
  ),
  UserModal(
    name: "Alice Johnson",
    profilePicture: "assets/alice_johnson.jpg",
    isSelected: false,
  ),
  UserModal(
    name: "Alice Johnson",
    profilePicture: "assets/alice_johnson.jpg",
    isSelected: false,
  ),
  UserModal(
    name: "Alice Johnson",
    profilePicture: "assets/alice_johnson.jpg",
    isSelected: false,
  ),
];

List<UserModal> selected = [];
