import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductViewCarosil extends StatefulWidget {
  final List<String> productImages;

  const ProductViewCarosil({Key? key, required this.productImages})
      : super(key: key);

  @override
  _ProductViewCarosilState createState() => _ProductViewCarosilState();
}

class _ProductViewCarosilState extends State<ProductViewCarosil> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [

          CarouselSlider(
            items: widget.productImages.map((img) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: img.startsWith('http')
                    ? Image.network(img, width: double.infinity, fit: BoxFit.cover)
                    : Image.asset(img, width: double.infinity, fit: BoxFit.cover),
              );
            }).toList(),
            options: CarouselOptions(
              height: 250,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.productImages.asMap().entries.map((entry) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _currentImageIndex == entry.key ? 10 : 8,
                height: _currentImageIndex == entry.key ? 10 : 8,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentImageIndex == entry.key ? Colors.red : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
