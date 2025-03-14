import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../widgets/build_text_widget.dart';

class GetYourOrderPage extends StatefulWidget {
  @override
  _GetYourOrderPageState createState() => _GetYourOrderPageState();
}

class _GetYourOrderPageState extends State<GetYourOrderPage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/images/svgs/image3.svg",
            width: screenWidth,
          ),

          BuildTextWidget(
            text: "Get Your Order",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BuildTextWidget(
              text: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
              fontSize: 14,
              color: AppColors.black_light,
            ),
          ),
        ],
      ),
    );
  }
}
