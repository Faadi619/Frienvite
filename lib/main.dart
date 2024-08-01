import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/utils/routes/routes.dart';
import 'package:frienivite_app/utils/routes/routes_name.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'Core/localiztion/messages/messages.dart';
import 'Core/multiproviders_list/provider_list.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // final prefs = await SharedPreferences.getInstance();
  // final isSplash = prefs.getBool('splash') ?? true;

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // bool isSplash;
  const MyApp({super.key});
  // Design width and height
  static const double _designWidth = 410;
  static const double _designHeight = 849;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(MyApp._designWidth, MyApp._designHeight),
      builder: (context, widget) {
        return MultiProvider(
          providers: providers,
          child: GetMaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            translations: Messages(),
            fallbackLocale: const Locale('en', 'US'),
            textDirection: TextDirection.ltr,
            // locale: const Locale('en', 'US'),
            theme: ThemeData(
              scaffoldBackgroundColor: whiteColor,
              fontFamily: 'Poppins',
              checkboxTheme: CheckboxThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.r),
                  side: WidgetStateBorderSide.resolveWith(
                      (Set<WidgetState> states) {
                    if (states.contains(WidgetState.selected)) {
                      return const BorderSide(
                        width: 1,
                        color: baseColor,
                      );
                    }
                    return null; // use the default for other states
                  }), // Narrow border
                ),
              ),
              datePickerTheme: const DatePickerThemeData(
                backgroundColor: whiteColor,
              ),
              dialogTheme: const DialogTheme(
                backgroundColor: whiteColor,
              ),
              colorScheme: ColorScheme.fromSeed(
                // onBackground: baseColor, // Background color
                onPrimary: whiteColor,
                seedColor: whiteColor,
                secondaryContainer: baseColor,
                secondary: baseColor,
                surfaceTint: whiteColor,
                primary: baseColor,
                onSecondary: whiteColor,
              ),
              textTheme:
                  GoogleFonts.poppinsTextTheme(), // Use Poppins font family
            ),
            // home: const EditEventScreen(),
            initialRoute: RoutesName.splash,
            onGenerateRoute: Routes.generateRoute,
          ),
        );
      },
    );
  }
}
