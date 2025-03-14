import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SimilarProductsWidget extends StatefulWidget {
  final List<String> productImages;
  final String productName;
  final String productPrice;

  const SimilarProductsWidget({
    Key? key,
    required this.productImages,
    required this.productName,
    required this.productPrice,
  }) : super(key: key);

  @override
  _SimilarProductsWidgetState createState() => _SimilarProductsWidgetState();
}

class _SimilarProductsWidgetState extends State<SimilarProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Similar To 282+ Items",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.productImages.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 140,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 2,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: widget.productImages[index].startsWith('http')
                            ? Image.network(
                          widget.productImages[index],
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                            : Image.asset(
                          widget.productImages[index],
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 5),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "${widget.productName} ${index + 1}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "\$${(widget.productPrice)}",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
