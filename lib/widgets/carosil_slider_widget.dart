import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopywelll/utils/app_colors.dart';

class CarosilSliderWidget extends StatefulWidget {
  @override
  _CarosilSliderWidgetState createState() => _CarosilSliderWidgetState();
}

class _CarosilSliderWidgetState extends State<CarosilSliderWidget> {
  final List<String> bannerImages = [
    "assets/images/carosil_imgage1.png",
    "assets/images/carosil_imgage1.png",
    "assets/images/carosil_imgage1.png",
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width/1.1,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 190,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: bannerImages.map((imagePath) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(bannerImages.length, (index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: _currentIndex == index ? 12 : 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? AppColors.pink : AppColors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}
