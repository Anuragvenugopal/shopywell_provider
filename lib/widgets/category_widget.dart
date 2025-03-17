import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"name": "Beauty", "image": "assets/images/beauty.png"},
    {"name": "Fashion", "image": "assets/images/fashion.png"},
    {"name": "Kids", "image": "assets/images/kids.png"},
    {"name": "Mens", "image": "assets/images/mens.png"},
    {"name": "Womens", "image": "assets/images/womens.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90, // Adjusted to fit everything
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox( // Added SizedBox with fixed height
              height: 80, // Adjusted to avoid overflow
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center content
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      radius: 35,
                      backgroundImage: AssetImage(categories[index]["image"]!),
                    ),
                    const SizedBox(height: 4), // Reduced spacing
                    Text(
                      categories[index]["name"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
