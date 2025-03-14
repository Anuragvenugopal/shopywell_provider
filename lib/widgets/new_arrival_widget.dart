import 'package:flutter/material.dart';
import 'package:shopywelll/widgets/product_list_widget.dart';

class NewArrivalsWidget extends StatefulWidget {
  const NewArrivalsWidget({Key? key}) : super(key: key);

  @override
  State<NewArrivalsWidget> createState() => _NewArrivalsWidgetState();
}

class _NewArrivalsWidgetState extends State<NewArrivalsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Arrivals",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ProductListWidget(),
        ],
      ),
    );
  }
}
