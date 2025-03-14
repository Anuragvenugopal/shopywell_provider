import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'build_text_widget.dart';


class SpecialOfferWidget extends StatefulWidget {
  const SpecialOfferWidget({Key? key}) : super(key: key);

  @override
  State<SpecialOfferWidget> createState() => _SpecialOffersWidgetState();
}

class _SpecialOffersWidgetState extends State<SpecialOfferWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/offer.png",
              height: 80,
              width: 80,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildTextWidget(text: 'Special Offers',fontWeight: FontWeight.bold,fontSize: 16,color: AppColors.black,),
                BuildTextWidget(text: 'Get the best deals at best prices!',fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.black,),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
