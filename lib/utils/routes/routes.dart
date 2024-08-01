import 'package:flutter/material.dart';
import 'package:frienivite_app/utils/routes/gesture_back/back_gesture.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';
import 'package:frienivite_app/view/PrivateEvents/SeeAllInvitations/see_all_invitations.dart';
import 'package:frienivite_app/view/PrivateEvents/SeeAllPolls/see_all_polls.dart';
import 'package:frienivite_app/view/PrivateEvents/edit_event_screen.dart';
import 'package:frienivite_app/view/PrivateEvents/see_all_upcoming_events.dart';
import 'package:frienivite_app/view/Profile/edit_profile_screen.dart';
import 'package:frienivite_app/view/Profile/language_screen.dart';
import 'package:frienivite_app/view/Profile/privacy_policy_screen.dart';
import 'package:frienivite_app/view/Profile/profile_screen.dart';
import 'package:frienivite_app/view/add_event_screen/add_event_screen.dart';
import 'package:frienivite_app/view/Event_Detail_Screen/event_detail_screen.dart';
import 'package:frienivite_app/view/app_main_screen/app_main_screen.dart';
import 'package:frienivite_app/view/forget_password/forget_password.dart';
import 'package:frienivite_app/view/friend_detail_screen/friend_detail_screen.dart';
import 'package:frienivite_app/view/groups/Groups_Screen.dart';
import 'package:frienivite_app/view/loginoption/login_option.dart';
import 'package:frienivite_app/view/loginoption/login_option2.dart';
import 'package:frienivite_app/view/phone_verification/phone_verifcation_screen.dart';
import 'package:frienivite_app/view/public_screen/recomended_events.dart';
import 'package:frienivite_app/view/public_screen/see_all_nearby_screen.dart';
import 'package:frienivite_app/view/sign_in_screen.dart/sign_in_screen.dart';
import 'package:frienivite_app/view/sign_up/sign_up_screen.dart';
import 'package:frienivite_app/view/splash_screen/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class Routes {
  //Used For GetX Route
  //Used For Material Page Route
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return _slideRoute(SplashScreen());
      case RoutesName.forgetpass:
        return _slideRoute(const ForgetPassword());
      case RoutesName.signUp:
        return _slideRoute(const SignUpScreen());
      case RoutesName.eventdetail:
        return _slideRoute(const EventDetailScreen());
      case RoutesName.seeallnearbyevents:
        return _slideRoute(const SeeAllNearByEvents());
      case RoutesName.recomendedforyou:
        return _slideRoute(const RecomendedEventsScreen());
      case RoutesName.editevent:
        return _slideRoute(const EditEventScreen());
      case RoutesName.signIn:
        return _slideRoute(const SignInScreen());
      case RoutesName.profilescreen:
        return _slideRoute(const ProfileScreen());
      case RoutesName.seeallpolls:
        return _slideRoute(const SeeAllPollsScreen());
      case RoutesName.seeallinvitations:
        return _slideRoute(const SeeAllInvitationsScreen());
      case RoutesName.editprofile:
        return _slideRoute(const EditProfileScreen());
      case RoutesName.seeupcomingevents:
        return _slideRoute(const SeeAllEventsScreen());
      case RoutesName.home:
        return _slideRoute(const AppMainScreen());
      case RoutesName.langugescreen:
        return _slideRoute(const LangugaeScreen());
      case RoutesName.privacy:
        return _slideRoute(const PrivacyPolicy());
      case RoutesName.groupsScreen:
        return _slideRoute(const GroupSceen());
      case RoutesName.friendDetail:
        return _slideRoute(const FriendDetailScreen());
      case RoutesName.phoneverify:
        return _slideRoute(const PhoneVerificationScreen());
      case RoutesName.addEvent:
        return _slideRoute(const AddNewEventScreen());
      case RoutesName.loginoption2:
        return _slideRoute(const LoginOptionScreen2());
      case RoutesName.loginoption:
        return _slideRoute(const LoginOptionScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }

  static PageRouteBuilder _slideRoute(Widget page) {
    return PageRouteBuilder(
      fullscreenDialog: true,
      // Page builder to display the target page
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Define animation for sliding the page in
        var begin = const Offset(1.0, 0.0); // Start from right side of screen
        var end = Offset.zero; // End at center of screen
        var curve = Curves.ease; // Use ease curve for animation

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        // Apply the slide transition animation to the child (target page)
        return SwipeBackDetector(
          child: SlideTransition(
            position: animation.drive(tween),
            child: child,
          ),
        );
      },
    );
  }
}
