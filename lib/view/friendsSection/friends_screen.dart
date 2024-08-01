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
import 'package:frienivite_app/view/friendsSection/friends_section.dart';
import 'package:frienivite_app/view/friendsSection/requests_section.dart';
import 'package:frienivite_app/view/friendsSection/suggestions_section.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              toolbarHeight: 5.h,
              automaticallyImplyLeading: false,
              backgroundColor: whiteColor,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [],
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: FriendsTabBarHead(),
              ),
            ),
          ];
        },
        body: const FriendsTabBarBody(),
      ),
    );
  }
}

////
////Widgets of this Screen
////

//Tab Bar Header

class FriendsTabBarBody extends StatelessWidget {
  const FriendsTabBarBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: BouncingScrollPhysics(),
      children: [
        FriendsSection(),
        RequestSection(),
        SuggestionSection(),
      ],
    );
  }
}

//Tab Bar Header
class FriendsTabBarHead extends StatelessWidget {
  const FriendsTabBarHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      child: TabBar(
        dividerColor: Colors.transparent,
        tabs: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.sp, top: 10.sp),
            child: Text(
              "Friends",
              style: TextStyle(
                fontSize: 14.sp,
                // color: blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.sp, top: 10.sp),
            child: Text(
              "Requests",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.sp, top: 10.sp),
            child: Text(
              "Add friends",
              style: TextStyle(
                fontSize: 14.sp,
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
