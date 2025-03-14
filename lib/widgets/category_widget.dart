import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final List<Map<String, String>> categories = [
    {"name": "Beauty", "image": "assets/images/beauty.png"},
    {"name": "Fashion", "image": "assets/images/fashion.png"},
    {"name": "Kids", "image": "assets/images/kids.png"},
    {"name": "Mens", "image": "assets/images/mens.png"},
    {"name": "Womens", "image": "assets/images/womens.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  radius: 35,
                  backgroundImage: AssetImage(categories[index]["image"]!),
                ),
                SizedBox(height: 5),
                // Text(categories[index]["name"]!),
              ],
            ),
          );
        },
      ),
    );
  }
}
