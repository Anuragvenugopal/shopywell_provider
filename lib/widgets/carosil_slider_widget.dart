import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 160,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
      ),
      items: bannerImages.map((imagePath) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );
  }
}
