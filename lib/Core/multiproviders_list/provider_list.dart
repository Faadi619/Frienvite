// ignore_for_file: depend_on_referenced_packages

import 'package:frienivite_app/Core/multiproviders_list/previous_page.dart';
import 'package:frienivite_app/view/add_event_screen/provider/list_provider.dart';
import 'package:frienivite_app/view/loginoption/login_option_provider.dart';
import 'package:frienivite_app/view_models/admin_side_view_models/sign_in_view_model.dart';
import 'package:frienivite_app/view_models/calendar_view_model/calender_provider.dart';
import 'package:frienivite_app/view_models/user_side_view_models/sign_in_view_model.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

//
/// MultiProvider is a provider that merges multiple providers into one.
///
List<SingleChildWidget> providers = [
  // view models for admin side
  ChangeNotifierProvider(create: (_) => AdminSignInViewModel()),
  ChangeNotifierProvider(create: (_) => AdminSignInViewModel()),
  ChangeNotifierProvider(create: (_) => LoginMethodProvider()),
  ChangeNotifierProvider(create: (_) => NavigationProvider()),
  ChangeNotifierProvider(create: (_) => ListIndexProvider()),
  ChangeNotifierProvider(create: (_) => CalendarProvider()),

  // view models for User side
  ChangeNotifierProvider(create: (_) => UserSignInViewModel()),
  ChangeNotifierProvider(create: (_) => UserSignInViewModel()),
];
