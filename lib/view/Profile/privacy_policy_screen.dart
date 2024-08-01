import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:frienivite_app/Core/Components/helper_components.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/assets.dart';
import 'package:frienivite_app/Core/constant/colors.dart';
import 'package:frienivite_app/view/Profile/profile_screen.dart';
import 'package:frienivite_app/view/friend_detail_screen/friend_detail_screen.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    final String longText = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vehicula mi at dolor commodo, a elementum velit vestibulum. Integer non nulla orci. Duis at orci vel turpis consectetur dapibus sit amet sit amet felis. Cras nec elit nec libero sagittis facilisis at sed sapien. Quisque egestas fermentum urna, eget vulputate ipsum elementum a. Phasellus vel tellus a orci tempor tincidunt. Donec non quam felis. Suspendisse potenti. Vivamus efficitur odio id quam vestibulum laoreet. Sed vel orci vel libero feugiat mollis.

Nullam vehicula quam in purus cursus, non varius dui suscipit. Fusce vitae sapien sit amet urna dictum varius. Nam sit amet gravida orci. Cras sed vehicula metus. Integer vehicula quam a justo feugiat hendrerit. Suspendisse volutpat nisl libero, a porttitor ligula varius non. Aenean ut consectetur leo. Integer et fringilla tortor, ut finibus lectus.

Fusce et mi vitae elit sollicitudin dignissim. Proin fermentum consequat mauris, et efficitur nisi fringilla ac. Mauris faucibus ante sed risus vestibulum, at vestibulum lectus efficitur. Nullam quis ex libero. Nam et purus sit amet metus blandit hendrerit. In vehicula nisl nec ipsum venenatis, et auctor elit sagittis. Cras tristique viverra diam vel viverra. Proin posuere fermentum orci, et lacinia odio. Nulla vel ante a arcu malesuada consequat. Sed suscipit mauris ut erat bibendum, ut fermentum dolor vestibulum. Proin faucibus nulla at sem scelerisque, a facilisis ligula ullamcorper. Phasellus id sollicitudin neque.

Donec at malesuada ligula. Maecenas interdum velit a urna viverra, et blandit risus sollicitudin. Nullam eget ultricies urna, sed fermentum nulla. Curabitur id metus libero. Aenean suscipit, purus ut porttitor ultricies, purus purus dictum leo, sit amet sollicitudin sapien urna sit amet ipsum. Nam ut eros ac nulla pharetra aliquam. Aenean ut nisl tellus. Fusce sed laoreet metus. Suspendisse vel suscipit lorem. In tristique dolor eget est lacinia, non hendrerit nulla suscipit. Vestibulum sit amet erat aliquam, condimentum libero a, fermentum nunc. Curabitur venenatis augue a nunc lacinia, sed ultricies mauris viverra.

Sed id tempor sapien, nec ultricies sem. Aliquam erat volutpat. Pellentesque accumsan et lacus in finibus. Vestibulum consectetur, lorem et fermentum sagittis, magna risus suscipit enim, ac vulputate quam justo eu augue. Aliquam bibendum diam sit amet dictum ullamcorper. Integer condimentum consectetur tincidunt. In euismod risus at tortor hendrerit, at mollis mi dapibus. Cras id est sapien. Etiam accumsan gravida velit, a convallis magna suscipit vel. Donec eget malesuada mi. Nulla in libero massa. Suspendisse sit amet gravida erat, vitae auctor nulla.
''';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              VerticalSizedBox(vertical: 25.h),
              ProfileScreenAppBar(
                title: "Privacy Policy",
              ),
              VerticalSizedBox(vertical: 25.h),
              Padding(
                padding: EdgeInsets.all(12.r),
                child: CustomText(
                  text: longText,
                  fontSize: 16.sp,
                  color: blackColor,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
