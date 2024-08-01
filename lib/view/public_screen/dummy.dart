// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:frienivite_app/Core/Components/custom_container.dart';
// import 'package:frienivite_app/Core/Components/helper_components.dart';
// import 'package:frienivite_app/Core/Components/text_widget.dart';
// import 'package:frienivite_app/Core/constant/assets.dart';
// import 'package:frienivite_app/Core/constant/colors.dart';
// import 'package:frienivite_app/utils/routes/routes_name.dart';
// import 'package:frienivite_app/view/PrivateEvents/filter_bottomsheet.dart';
// import 'package:frienivite_app/view/PrivateEvents/private_event_screen.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// class PublicEventScreen extends StatefulWidget {
//   const PublicEventScreen({super.key});

//   @override
//   State<PublicEventScreen> createState() => _PublicEventScreenState();
// }

// class _PublicEventScreenState extends State<PublicEventScreen> {
//   List<Category> categories = [
//     Category(name: 'Conference & corporate', icon: Icons.business),
//     Category(name: 'Art & culture', icon: Icons.palette),
//     Category(name: 'Theatre & movie', icon: Icons.theaters),
//     Category(name: 'Market & shopping', icon: Icons.shopping_cart),
//     Category(name: 'Games & entertainment', icon: Icons.videogame_asset),
//     Category(name: 'Family & kids', icon: Icons.family_restroom),
//     Category(name: 'Party & nightlife', icon: Icons.nightlife),
//     Category(name: 'Sports & e-Sports', icon: Icons.sports_esports),
//     Category(name: 'Charity & volunteering', icon: Icons.volunteer_activism),
//     Category(name: 'Holiday events', icon: Icons.event),
//     Category(name: 'Concert & music', icon: Icons.music_note),
//     Category(name: 'Food & beverage', icon: Icons.fastfood),
//     Category(name: 'Private Event', icon: Icons.lock),
//     Category(name: 'Social & dating', icon: Icons.people),
//     Category(name: 'Festival', icon: Icons.festival),
//     Category(name: 'Education', icon: Icons.school),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // const HeaderOfPriveteEventScreen(),
//           VerticalSizedBox(vertical: 45.h),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 14.w),
//             child: const HeaderOfPriveteEventScreen(),
//           ),
//           VerticalSizedBox(vertical: 20.h),
//           const SearchWidgetOfPrivateEvent(),
//           VerticalSizedBox(vertical: 10.h),
//           CategoriesPrivateEvent(categories: categories),
//           VerticalSizedBox(vertical: 10.h),
//           NearByEvents(title: "Nearby Events"),
//           VerticalSizedBox(vertical: 10.h),
//           NearByListViewWidget(categories: categories),
//           VerticalSizedBox(vertical: 10.h),
//           NearByEvents(title: "Recommended for you"),
//           PollsListViewWidget(categories: categories),
//         ],
//       ),
//     );
//   }
// }

// class PollsListViewWidget extends StatelessWidget {
//   const PollsListViewWidget({
//     super.key,
//     required this.categories,
//   });

//   final List<Category> categories;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: categories.length, // Total number of items
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomContainer(
//               borderColor: const Color(0xffE7E7E7),
//               backgroundColor: whiteColor,
//               borderRadius: 12.r,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 10.w,
//                   vertical: 10.h,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       eventdumy,
//                       height: 96.h,
//                     ),
//                     HorizontalSizedBox(horizontalSpace: 10.w),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         VerticalSizedBox(vertical: 5.h),
//                         SizedBox(
//                           width: 220.w,
//                           child: CustomText(
//                             text: "Dance party at the top of the town - 2024",
//                             fontSize: 14.sp,
//                             color: blackColor,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         VerticalSizedBox(vertical: 20.h),
//                         Row(
//                           children: [
//                             const Icon(
//                               Icons.location_on_outlined,
//                             ),
//                             HorizontalSizedBox(horizontalSpace: 5.w),
//                             CustomText(
//                               text: "New York",
//                               fontSize: 12.sp,
//                               color: greyColor,
//                               fontWeight: FontWeight.w400,
//                             ),
//                             HorizontalSizedBox(horizontalSpace: 60.w),
//                             CustomContainer(
//                               borderRadius: 8.r,
//                               backgroundColor: baseColor,
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 15.w, vertical: 4.h),
//                                 child: CustomText(
//                                   text: "Vote",
//                                   fontSize: 12.sp,
//                                   color: whiteColor,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class NearByListViewWidget extends StatelessWidget {
//   const NearByListViewWidget({
//     super.key,
//     required this.categories,
//   });

//   final List<Category> categories;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 360.h,
//       child: ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length, // Total number of items
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomContainer(
//               borderColor: greyColor.withOpacity(0.3),
//               borderRadius: 15.r,
//               child: Padding(
//                 padding: EdgeInsets.all(12.r),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 180.h,
//                       width: 315.w,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(event2),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           VerticalSizedBox(vertical: 12.h),
//                           Row(
//                             children: [
//                               HorizontalSizedBox(horizontalSpace: 12.w),
//                               CustomContainer(
//                                 borderRadius: 6.r,
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 10.w, vertical: 7.h),
//                                   child: CustomText(
//                                     text: "Dance",
//                                     fontSize: 12.sp,
//                                     color: blackColor,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           const Spacer(),
//                           Row(
//                             children: [
//                               HorizontalSizedBox(horizontalSpace: 20.w),
//                               Image.asset(
//                                 p1,
//                                 height: 40.h,
//                                 width: 40.w,
//                               ),
//                               HorizontalSizedBox(horizontalSpace: 15.w),
//                               CustomText(
//                                 text: "Altanito Salami",
//                                 fontSize: 14.sp,
//                                 color: whiteColor,
//                                 fontWeight: FontWeight.w400,
//                               )
//                             ],
//                           ),
//                           VerticalSizedBox(vertical: 10.h),
//                         ],
//                       ),
//                     ),
//                     VerticalSizedBox(vertical: 10.h),
//                     CustomText(
//                       text: "Going to a Rock Concert",
//                       fontSize: 16.sp,
//                       color: blackColor,
//                       fontWeight: FontWeight.w700,
//                     ),
//                     VerticalSizedBox(vertical: 10.h),
//                     CustomText(
//                       text: "THU 26 May, 09:00 - FRI 27 May, 10:00",
//                       fontSize: 14.sp,
//                       color: blackColor.withOpacity(0.75),
//                       fontWeight: FontWeight.w400,
//                     ),
//                     VerticalSizedBox(vertical: 10.h),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: 100.w,
//                           height: 60.h,
//                           child: Stack(
//                             children: [
//                               Image.asset(
//                                 p1,
//                                 height: 30.h,
//                                 width: 30.h,
//                               ),
//                               Positioned(
//                                 left:
//                                     20.w, // Half of the image width to overlap
//                                 child: Image.asset(
//                                   p1,
//                                   height: 30.h,
//                                   width: 30.h,
//                                 ),
//                               ),
//                               Positioned(
//                                 left:
//                                     40.w, // Half of the image width to overlap
//                                 child: Image.asset(
//                                   p1,
//                                   height: 30.h,
//                                   width: 30.h,
//                                 ),
//                               ),
//                               Positioned(
//                                 left:
//                                     60.w, // Half of the image width to overlap
//                                 child: CustomContainer(
//                                   height: 35.h,
//                                   borderColor: whiteColor,
//                                   width: 35.h,
//                                   borderRadius: 100.r,
//                                   backgroundColor: baseColor,
//                                   child: Center(
//                                     child: CustomText(
//                                       text: "+15",
//                                       fontSize: 16.sp,
//                                       color: whiteColor,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         HorizontalSizedBox(horizontalSpace: 70.w),
//                         CustomContainer(
//                           backgroundColor: baseColor,
//                           borderRadius: 8.r,
//                           child: Padding(
//                             padding: EdgeInsets.all(10.r),
//                             child: CustomText(
//                               text: "Accept",
//                               fontSize: 12.sp,
//                               color: whiteColor,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                         HorizontalSizedBox(horizontalSpace: 10.w),
//                         CustomContainer(
//                           backgroundColor: whiteColor,
//                           borderColor: baseColor,
//                           borderRadius: 8.r,
//                           child: Padding(
//                             padding: EdgeInsets.all(10.r),
//                             child: CustomText(
//                               text: "Decline",
//                               fontSize: 12.sp,
//                               color: baseColor,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class NearByEvents extends StatelessWidget {
//   String title;

//   NearByEvents({
//     super.key,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 15.w),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           CustomText(
//             text: title,
//             fontSize: 22.sp,
//             color: blackColor,
//             fontWeight: FontWeight.w700,
//           ),
//           GestureDetector(
//             onTap: () {
//               if (title == "Nearby Events") {
//                 Navigator.pushNamed(context, RoutesName.seeallnearbyevents);
//               } else if (title == "Recommended for you") {
//                 Navigator.pushNamed(context, RoutesName.recomendedforyou);
//               }
//             },
//             child: CustomText(
//               text: "See All",
//               fontSize: 14.sp,
//               color: baseColor,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CategoriesPrivateEvent extends StatelessWidget {
//   const CategoriesPrivateEvent({
//     super.key,
//     required this.categories,
//   });

//   final List<Category> categories;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 65.h,
//       child: ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length, // Total number of items
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CustomContainer(
//               borderColor: greyColor.withOpacity(0.1),
//               backgroundColor: whiteColor,
//               borderRadius: 12.r,
//               child: Padding(
//                 padding: EdgeInsets.all(12.r),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       categories[index].icon,
//                       color: baseColor,
//                     ),
//                     HorizontalSizedBox(horizontalSpace: 10.w),
//                     CustomText(
//                       text: categories[index].name,
//                       fontSize: 14.sp,
//                       color: blackColor,
//                       fontWeight: FontWeight.w500,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class SearchWidgetOfPrivateEvent extends StatelessWidget {
//   const SearchWidgetOfPrivateEvent({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 12.sp),
//       child: CustomContainer(
//         width: 1.sw,
//         height: 50.h,
//         child: TextField(
//           decoration: InputDecoration(
//             hintText: 'Search',
//             suffixIcon: GestureDetector(
//               onTap: () {
//                 showMaterialModalBottomSheet(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.vertical(
//                       top: Radius.circular(30.r),
//                     ),
//                   ),
//                   context: context,
//                   builder: (context) => const FilterBottomSheet(),
//                 );
//               },
//               child: GestureDetector(
//                 child: const Icon(Icons.filter_list),
//               ),
//             ),
//             prefixIcon: const Icon(
//               Icons.search_sharp,
//             ),
//             contentPadding:
//                 EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.0),
//               borderSide: BorderSide(
//                 color: Colors.grey.shade300,
//                 width: 1.0,
//               ),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.0),
//               borderSide: BorderSide(
//                 color: Colors.grey.shade100,
//                 width: 1.0,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.0),
//               borderSide: const BorderSide(
//                 color: baseColor,
//                 width: 1.5,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Category {
//   final String name;
//   final IconData icon;

//   Category({required this.name, required this.icon});
// }
