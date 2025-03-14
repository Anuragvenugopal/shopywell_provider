import 'package:flutter/material.dart';
import 'package:shopywelll/widgets/build_text_widget.dart';

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
              BuildTextWidget(
                text: 'Deal of the Day',
                fontSize: 16,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: 5),
                  BuildTextWidget(
                    text: '22h 55m 20s remaining',
                    fontSize: 14,
                    color: AppColors.white,
                  ),

                ],
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.white),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BuildTextWidget(
                  text: 'View all',
                  fontSize: 14,
                  color: AppColors.white,
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
