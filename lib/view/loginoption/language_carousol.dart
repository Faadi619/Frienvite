import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frienivite_app/Core/Components/text_widget.dart';
import 'package:frienivite_app/Core/constant/colors.dart';

class LanguageCarousel extends StatefulWidget {
  @override
  _LanguageCarouselState createState() => _LanguageCarouselState();
}

class _LanguageCarouselState extends State<LanguageCarousel> {
  List<String> texts = ["GER", "ARA", "ENG", "FRA", "SPA"];
  int _selectedIndex = 2; // Initial value
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: CarouselSlider.builder(
        carouselController: _carouselController,
        itemCount: texts.length,
        itemBuilder: (context, index, realIdx) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              _carouselController.animateToPage(index);
            },
            child: Center(
                child: CustomText(
              text: texts[index],
              fontSize: _selectedIndex == index ? 20.sp : 18.sp,
              color: _selectedIndex == index ? blackColor : greyColor,
              fontWeight: FontWeight.w500,
            )),
          );
        },
        options: CarouselOptions(
          viewportFraction: 0.18,
          height: 100, // Adjust the height as needed
          initialPage: _selectedIndex,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              _selectedIndex = index;
            });
            _carouselController.animateToPage(index);
          },
        ),
      ),
    );
  }
}
