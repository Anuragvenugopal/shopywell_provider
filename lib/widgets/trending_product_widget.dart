import 'package:flutter/material.dart';
import 'package:shopywelll/widgets/product_list_widget.dart';

class TrendingProductsWidget extends StatefulWidget {
  const TrendingProductsWidget({Key? key}) : super(key: key);

  @override
  State<TrendingProductsWidget> createState() => _TrendingProductsWidgetState();
}

class _TrendingProductsWidgetState extends State<TrendingProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trending Products",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ProductListWidget(),
        ],
      ),
    );
  }
}
