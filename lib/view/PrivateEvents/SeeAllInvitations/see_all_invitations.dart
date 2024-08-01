import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frienivite_app/Core/Components/custom_container.dart';
import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/Core/multiproviders_list/previous_page.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';
import 'package:frienivite_app/view/PrivateEvents/filter_bottomsheet.dart';
import 'package:frienivite_app/view/groups/chat_header.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SeeAllInvitationsScreen extends StatefulWidget {
  const SeeAllInvitationsScreen({super.key});

  @override
  State<SeeAllInvitationsScreen> createState() =>
      _SeeAllInvitationsScreenState();
}

class _SeeAllInvitationsScreenState extends State<SeeAllInvitationsScreen> {
  List<Category> categories = [
    Category(
      name: 'Conference & corporate',
      icon: Icons.business,
      isSelected: false,
    ),
    Category(
      name: 'Art & culture',
      icon: Icons.palette,
      isSelected: false,
    ),
    Category(
      name: 'Theatre & movie',
      icon: Icons.theaters,
      isSelected: false,
    ),
    Category(
      name: 'Market & shopping',
      icon: Icons.shopping_cart,
      isSelected: false,
    ),
    Category(
      name: 'Games & entertainment',
      icon: Icons.videogame_asset,
      isSelected: false,
    ),
    Category(
      name: 'Family & kids',
      icon: Icons.family_restroom,
      isSelected: false,
    ),
    Category(
      name: 'Party & nightlife',
      icon: Icons.nightlife,
      isSelected: false,
    ),
    Category(
      name: 'Sports & e-Sports',
      icon: Icons.sports_esports,
      isSelected: false,
    ),
    Category(
      name: 'Charity & volunteering',
      icon: Icons.volunteer_activism,
      isSelected: false,
    ),
    Category(
      name: 'Holiday events',
      icon: Icons.event,
      isSelected: false,
    ),
    Category(
      name: 'Concert & music',
      icon: Icons.music_note,
      isSelected: false,
    ),
    Category(
      name: 'Food & beverage',
      icon: Icons.fastfood,
      isSelected: false,
    ),
    Category(
      name: 'Private Event',
      icon: Icons.lock,
      isSelected: false,
    ),
    Category(
      name: 'Social & dating',
      icon: Icons.people,
      isSelected: false,
    ),
    Category(
      name: 'Festival',
      icon: Icons.festival,
      isSelected: false,
    ),
    Category(
      name: 'Education',
      icon: Icons.school,
      isSelected: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: const HeaderOfPriveteEventScreen(),
      ),
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 2,
          child: SafeArea(
            child: Column(
              children: [
                VerticalSizedBox(vertical: 20.h),
                const SearchWidgetOfPrivateEvent(),
                VerticalSizedBox(vertical: 20.h),
                Row(
                  children: [
                    HorizontalSizedBox(horizontalSpace: 20.w),
                    CustomText(
                      text: "Invitations",
                      fontSize: 25.sp,
                      color: blackColor,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
                VerticalSizedBox(vertical: 10.h),
                SizedBox(
                  child: UpcomingPolls(categories: categories),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpcomingPolls extends StatefulWidget {
  const UpcomingPolls({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  State<UpcomingPolls> createState() => _UpcomingPollsState();
}

class _UpcomingPollsState extends State<UpcomingPolls> {
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    final previousPage = Provider.of<NavigationProvider>(context, listen: true);
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.categories.length, // Total number of items
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomContainer(
            borderColor: const Color(0xffE7E7E7),
            backgroundColor: whiteColor,
            borderRadius: 12.r,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              child: GestureDetector(
                onTap: () {
                  previousPage.setPreviousPage(frominvitation);
                  Navigator.pushNamed(context, RoutesName.eventdetail);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      eventdumy,
                      height: 100.h,
                    ),
                    HorizontalSizedBox(horizontalSpace: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VerticalSizedBox(vertical: 5.h),
                        SizedBox(
                          width: 220.w,
                          child: CustomText(
                            text: "Satellite mega festival - 2024",
                            fontSize: 14.sp,
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 220.w,
                          child: CustomText(
                            text: "Sat, May 1 • 2:00 PM",
                            fontSize: 13.sp,
                            color: baseColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: greyColor.withOpacity(0.8),
                            ),
                            HorizontalSizedBox(horizontalSpace: 5.w),
                            CustomText(
                              text: "New York",
                              fontSize: 12.sp,
                              color: greyColor.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                            ),
                            HorizontalSizedBox(horizontalSpace: 60.w),
                            Column(
                              children: [
                                Visibility(
                                  visible: !isAccepted,
                                  child: GestureDetector(
                                    onTap: () {
                                      //TODO: Add function here.
                                      setState(() {});
                                      isAccepted = true;
                                    },
                                    child: CustomContainer(
                                      width: 80.w,
                                      height: 25.h,
                                      borderRadius: 8.r,
                                      backgroundColor: baseColor,
                                      child: Center(
                                        child: CustomText(
                                          text: "Accept",
                                          fontSize: 12.sp,
                                          color: whiteColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalSizedBox(vertical: 10.h),
                                GestureDetector(
                                  onTap: () {
                                    //TODO: Add function here.
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return MyDialougeBoxWidget(
                                          onTap: () {
                                            setState(() {
                                              isAccepted = false;
                                            });
                                          },
                                          title:
                                              "Are you sure you want to Decline this Event?",
                                          context: context,
                                          description:
                                              "Are you sure you want to continue this? If you "
                                              "continue it, You will not be able to change it",
                                        );
                                      },
                                    );
                                  },
                                  child: CustomContainer(
                                    width: 80.w,
                                    height: 25.h,
                                    borderRadius: 8.r,
                                    backgroundColor:
                                        isAccepted ? redColor : whiteColor,
                                    borderColor:
                                        isAccepted ? whiteColor : baseColor,
                                    child: Center(
                                      child: CustomText(
                                        text: "Decline",
                                        fontSize: 12.sp,
                                        color:
                                            isAccepted ? whiteColor : baseColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class UpcomingEventsTabHeader extends StatelessWidget {
  const UpcomingEventsTabHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      tabs: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.sp, top: 10.sp),
          child: Text(
            "Polls",
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
            "My Events",
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
    );
  }
}

class HeaderOfPriveteEventScreen extends StatelessWidget {
  const HeaderOfPriveteEventScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
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
          Image.asset(
            logo,
            width: 140.w,
          ),
          Icon(
            Icons.notifications,
            color: Colors.transparent,
            size: 30.sp,
          )
        ],
      ),
    );
  }
}

class Category {
  final String name;
  final IconData icon;
  bool isSelected;

  Category({required this.name, required this.icon, this.isSelected = false});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          icon == other.icon;

  @override
  int get hashCode => name.hashCode ^ icon.hashCode;
}
//

class SearchWidgetOfPrivateEvent extends StatelessWidget {
  const SearchWidgetOfPrivateEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      child: CustomContainer(
        width: 1.sw,
        height: 50.h,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            suffixIcon: GestureDetector(
              onTap: () {
                showMaterialModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30.r),
                    ),
                  ),
                  context: context,
                  builder: (context) => const FilterBottomSheet(),
                );
              },
              child: GestureDetector(
                child: const Icon(Icons.filter_list),
              ),
            ),
            prefixIcon: const Icon(
              Icons.search_sharp,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.grey.shade100,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: baseColor,
                width: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
