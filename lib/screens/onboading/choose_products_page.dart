import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopywelll/utils/app_colors.dart';
import '../../widgets/build_text_widget.dart';

class ChooseProductsPage extends StatefulWidget {
  @override
  _ChooseProductsPageState createState() => _ChooseProductsPageState();
}

class _ChooseProductsPageState extends State<ChooseProductsPage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height:screenHeight/20,),
          SvgPicture.asset(
            "assets/images/svgs/image1.svg",
            width: screenWidth/1.2,
          ),
          SizedBox(height: 20),
          BuildTextWidget(
            text: "Choose Products",
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
