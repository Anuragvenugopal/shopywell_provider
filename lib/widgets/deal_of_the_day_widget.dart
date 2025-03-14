import 'package:flutter/material.dart';

import '../utils/app_colors.dart';


class DealOfTheDayWidget extends StatefulWidget {
  @override
  _DealOfTheDayWidgetState createState() => _DealOfTheDayWidgetState();
}

class _DealOfTheDayWidgetState extends State<DealOfTheDayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF409CFF), // Adjusted blue color
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deal of the Day",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [

                  SizedBox(width: 5),
                  Text(
                    "22h 55m 20s remaining",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.white),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "View all",
                  style: TextStyle(color: AppColors.white),
                ),
                SizedBox(width: 5),
                Icon(Icons.arrow_forward, color: AppColors.white, size: 16),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
