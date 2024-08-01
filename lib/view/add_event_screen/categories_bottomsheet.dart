import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/view/PrivateEvents/SeeAllInvitations/see_all_invitations.dart';
import 'package:frienivite_app/view/add_event_screen/provider/list_provider.dart';
import 'package:provider/provider.dart';

class CategoriesBottomSheet extends StatefulWidget {
  List<Category> categories;

  CategoriesBottomSheet({super.key, required this.categories});

  @override
  State<CategoriesBottomSheet> createState() => _CategoriesBottomSheetState();
}

class _CategoriesBottomSheetState extends State<CategoriesBottomSheet> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<ListIndexProvider>(context);
    return SizedBox(
      height: 0.80.sh,
      child: Column(
        children: [
          VerticalSizedBox(vertical: 20.h),
          CustomContainer(
            height: 3.h,
            width: 20.w,
            backgroundColor: lightGrey,
            borderRadius: 20.r,
          ),
          VerticalSizedBox(vertical: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Select Category",
                fontSize: 24.sp,
                color: blackColor,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          VerticalSizedBox(vertical: 10.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 3,
                ),
                itemCount: widget.categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        if (indexProvider.selectedIndex == index) {
                          indexProvider.setSelectedIndex(
                              -1); // Deselect if already selected
                        } else {
                          indexProvider.setSelectedIndex(
                              index); // Select if not already selected
                        }
                        var temp = widget.categories[indexProvider
                            .selectedIndex]; // Step 1: Store the selected category in a temporary variable
                        widget.categories[indexProvider.selectedIndex] = widget
                                .categories[
                            0]; // Step 2: Replace the selected category with the first category
                        widget.categories[0] = temp;
                      },
                      child: CustomContainer(
                        backgroundColor: index == 0 ? baseColor : whiteColor,
                        borderRadius: 12.r,
                        borderColor: greyColor.withOpacity(0.2),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              HorizontalSizedBox(horizontalSpace: 5.w),
                              Icon(
                                widget.categories[index].icon,
                                size: 20.sp,
                                color: index == 0 ? whiteColor : blackColor,
                              ),
                              Expanded(
                                child: Text(
                                  widget.categories[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: index == 0 ? whiteColor : blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
