import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AddressSelectionWidget extends StatefulWidget {
  @override
  _AddressSelectionWidgetState createState() => _AddressSelectionWidgetState();
}

class _AddressSelectionWidgetState extends State<AddressSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery Address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Icon(Icons.add_box_outlined, color: AppColors.primaryColor),
            ],
          ),
          SizedBox(height: 8),
          Text("Address: 216 St Paul's Rd, London N1 2LL, UK", style: TextStyle(fontSize: 14, color: Colors.black87)),
          Text("Contact: +44-784232", style: TextStyle(fontSize: 14, color: Colors.black54)),
        ],
      ),
    );
  }
}
