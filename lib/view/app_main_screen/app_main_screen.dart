import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/app_bar_widget.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';
import 'package:frienivite_app/view/PrivateEvents/private_event_screen.dart';
import 'package:frienivite_app/view/app_main_screen/cusom_app_bar.dart';
import 'package:frienivite_app/view/calender/calender_screen.dart';

import 'package:frienivite_app/view/friendsSection/friends_screen.dart';
import 'package:frienivite_app/view/friendsSection/friends_section.dart';

import 'package:frienivite_app/view/public_screen/public_screen.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  List<Widget> pages = [
    const CalenderScreen(),
    const PrivateEventScreen(),
    const FriendsScreen(),
    const PublicEventScreen(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 2
          ? PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: AppBarWidget2(
                color:
                    _currentIndex == 0 ? const Color(0xffEDF6FF) : whiteColor,
              ),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: AppBarWidget3(
                color:
                    _currentIndex == 0 ? const Color(0xffEDF6FF) : whiteColor,
              ),
            ),
      resizeToAvoidBottomInset: MediaQuery.of(context).viewInsets.bottom == 0,
      body: pages[_currentIndex],
      bottomSheet: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: baseColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.addEvent);
        },
        child: const Icon(
          Icons.add,
          color: whiteColor,
        ),
      ),
    );
  }
}
