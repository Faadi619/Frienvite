import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frienivite_app/Core/Components/app_bar_widget.dart';
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

class SeeAllEventsScreen extends StatefulWidget {
  const SeeAllEventsScreen({super.key});

  @override
  State<SeeAllEventsScreen> createState() => _SeeAllEventsScreenState();
}

class _SeeAllEventsScreenState extends State<SeeAllEventsScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  List<Category> categories = [
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
    Category(name: 'Food & beverage', icon: Icons.fastfood),
    Category(name: 'Private Event', icon: Icons.lock),
    Category(name: 'Social & dating', icon: Icons.people),
    Category(name: 'Festival', icon: Icons.festival),
    Category(name: 'Education', icon: Icons.school),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity != null) {
                if (_tabController.index == 0 && details.primaryVelocity! > 0) {
                  Navigator.pop(context);
                } else if (_tabController.index == 1 &&
                    details.primaryVelocity! > 0) {
                  _tabController.animateTo(0);
                }
              }
            },
            child: Column(
              children: [
                VerticalSizedBox(vertical: 20.h),
                const HeaderOfPriveteEventScreen(),
                VerticalSizedBox(vertical: 20.h),
                Expanded(
                  child: NestedScrollView(
                    floatHeaderSlivers: true,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          expandedHeight: 100.h,
                          toolbarHeight: 5.h,
                          automaticallyImplyLeading: false,
                          backgroundColor: whiteColor,
                          floating: false,
                          pinned: true,
                          snap: false,
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.pin,
                            background: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14.w),
                              child: const SearchWidgetOfPrivateEvent(),
                            ),
                          ),
                          bottom: PreferredSize(
                            preferredSize: const Size.fromHeight(50),
                            child: UpcomingEventsTabHeader(
                              tabController: _tabController,
                            ),
                          ),
                        ),
                      ];
                    },
                    body: TabBarView(
                      controller: _tabController,
                      children: [
                        UpcomingEventListview1(
                          categories: categories,
                          tabController: _tabController,
                        ),
                        MyEventWidget(
                          categories: categories,
                          tabController: _tabController,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyEventWidget extends StatelessWidget {
  const MyEventWidget({
    super.key,
    required this.categories,
    required this.tabController,
  });

  final List<Category> categories;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final previousPage = Provider.of<NavigationProvider>(context, listen: true);
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: categories.length, // Total number of items
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
                  previousPage.setPreviousPage(myevent);
                  Navigator.pushNamed(context, RoutesName.eventdetail);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      eventdumy,
                      height: 90.h,
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
                        VerticalSizedBox(vertical: 5.h),
                        SizedBox(
                          width: 220.w,
                          child: CustomText(
                            text: "Sat, May 1 • 2:00 PM",
                            fontSize: 13.sp,
                            color: baseColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        VerticalSizedBox(vertical: 10.h),
                        SizedBox(
                          width: 0.56.sw,
                          child: Row(
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
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return MyDialougeBoxWidget(
                                        title:
                                            "Are you sure you want to Cancel this Event?",
                                        context: context,
                                        description:
                                            "Are you sure you want to continue this? If you "
                                            "continue it, You will not be able to change it",
                                      );
                                    },
                                  );
                                },
                                child: CustomContainer(
                                  borderRadius: 8.r,
                                  backgroundColor: pinkColor,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 17.w, vertical: 6.h),
                                    child: CustomText(
                                      text: "Cancel Event",
                                      fontSize: 12.sp,
                                      color: whiteColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
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

class UpcomingEventListview1 extends StatelessWidget {
  const UpcomingEventListview1({
    super.key,
    required this.categories,
    required this.tabController,
  });

  final List<Category> categories;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final previousPage = Provider.of<NavigationProvider>(context, listen: true);
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null) {
          if (tabController.index == 0 && details.primaryVelocity! > 0) {
            Navigator.pop(context);
          } else if (tabController.index == 1 && details.primaryVelocity! > 0) {
            tabController.animateTo(0);
          }
        }
      },
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length, // Total number of items
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
                    previousPage.setPreviousPage(upcomingevent);
                    Navigator.pushNamed(context, RoutesName.eventdetail);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        eventdumy,
                        height: 90.h,
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
                          VerticalSizedBox(vertical: 5.h),
                          SizedBox(
                            width: 220.w,
                            child: CustomText(
                              text: "Sat, May 1 • 2:00 PM",
                              fontSize: 13.sp,
                              color: baseColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          VerticalSizedBox(vertical: 10.h),
                          SizedBox(
                            width: 0.56.sw,
                            child: Row(
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
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return MyDialougeBoxWidget(
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
                                    borderRadius: 8.r,
                                    backgroundColor: pinkColor,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 6.h),
                                      child: CustomText(
                                        text: "Decline",
                                        fontSize: 12.sp,
                                        color: whiteColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
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
      ),
    );
  }
}

class UpcomingEventsTabHeader extends StatelessWidget {
  const UpcomingEventsTabHeader({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      padding: EdgeInsets.zero,
      dividerColor: Colors.transparent,
      tabs: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.sp, top: 10.sp),
          child: Text(
            "Upcoming Events",
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

  Category({required this.name, required this.icon});
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
