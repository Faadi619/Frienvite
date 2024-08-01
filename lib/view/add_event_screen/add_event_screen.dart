import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:frienivite_app/Core/Components/app_bar_widget.dart';

import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/view/add_event_screen/date_poll_widget.dart';
import 'package:frienivite_app/view/add_event_screen/single_date_widget_main.dart';

class AddNewEventScreen extends StatefulWidget {
  const AddNewEventScreen({super.key});

  @override
  State<AddNewEventScreen> createState() => _AddNewEventScreenState();
}

class _AddNewEventScreenState extends State<AddNewEventScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteColor,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: whiteColor,
                expandedHeight: 240.h,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: const Color(0xffEDF6FF),
                    child: Column(
                      children: [
                        VerticalSizedBox(vertical: 60.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: AppBarWidget(title: "Create Event"),
                        ),
                        Image.asset(
                          event,
                          height: 150.h,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight),
                  child: TabBarHead(),
                ),
              ),
            ];
          },
          body: const Column(
            children: [
              const TabBarBody(),
            ],
          ),
        ),
      ),
    );
  }
}

////
////Widgets of this Screen
////

//Tab Bar Header

class TabBarBody extends StatelessWidget {
  const TabBarBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(
        physics: BouncingScrollPhysics(),
        children: [
          SingleDateWidget(),
          DatePollWidget(),
        ],
      ),
    );
  }
}

//Tab Bar Header
class TabBarHead extends StatelessWidget {
  const TabBarHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        tabs: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.sp, top: 10.sp),
            child: Text(
              "Single Date",
              style: TextStyle(
                fontSize: 20.sp,
                // color: blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.sp, top: 10.sp),
            child: Text(
              "Date Poll",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
        indicator: UnderlineTabIndicator(
          borderRadius: BorderRadius.circular(60.r),
          borderSide: BorderSide(width: 5.sp, color: baseColor),
        ),
        labelColor: baseColor,
        unselectedLabelColor: Color(0xffA7A7A7),
      ),
    );
  }
}
