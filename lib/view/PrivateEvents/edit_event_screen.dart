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
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/Core/multiproviders_list/previous_page.dart';
import 'package:frienivite_app/view/PrivateEvents/dates_poll_edit.dart';
import 'package:frienivite_app/view/PrivateEvents/single_date_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditEventScreen extends StatefulWidget {
  const EditEventScreen({
    super.key,
  });

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  // start date

//End date

  bool _isPublic = false;
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              VerticalSizedBox(vertical: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
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
                      text: "Edit Event",
                      fontSize: 22.sp,
                      color: blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    const Icon(
                      Icons.arrow_back,
                      color: Colors.transparent,
                    )
                  ],
                ),
              ),
              VerticalSizedBox(vertical: 15.h),
              const UploadImage(),
              VerticalSizedBox(vertical: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const CustomTextField1(
                  title: "Event Name",
                  hintText: "Event Name",
                ),
              ),
              VerticalSizedBox(vertical: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const CustomTextField1(
                  title: "Location",
                  hintText: "Location of Event",
                ),
              ),
              VerticalSizedBox(vertical: 20.h),

              //Start Date and Time Row

              navigationProvider.previousPage == myPoll
                  ? const DatePollEditEvent()
                  : const SingleDateEditWidget(),
              VerticalSizedBox(vertical: 20.h),
              //Description
              const DescriptionWidget(),
              //
              VerticalSizedBox(vertical: 20.h),
              //InviteFriends Row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InviteFriends(),
                  ],
                ),
              ),
              //
              VerticalSizedBox(vertical: 40.h),
              //
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomButton(title: "Save", onPressed: () {}),
              ),
              //
              VerticalSizedBox(vertical: 20.h),
            ],
          ),
        ),
      ),
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
      ),
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
        Container(
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
        maxLines: 4,
        borderRadius: 20.r,
        hintText: "Event Description",
        borderColor: greyColor.withOpacity(0.5),
      ),
    );
  }
}
