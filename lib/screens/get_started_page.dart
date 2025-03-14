import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/build_elivated_button_widget.dart';
import '../widgets/build_text_widget.dart';
import 'bottom_nav_screen.dart';
import 'home_page.dart';


class GetStartedPage extends StatefulWidget {
  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/image1.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: AppColors.black.withOpacity(0.3),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenHeight * 0.4,
              width: screenWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.black.withOpacity(0.9),
                    AppColors.black.withOpacity(0.5),
                    AppColors.transparent,
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BuildTextWidget(
                  text: 'You want\n' 'Authentic, here\n' '  you go!',
                  textAlign: TextAlign.center,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 34,
                ),
                SizedBox(height: 10),
                BuildTextWidget(
                  text: 'Find it here, buy it now!',
                  textAlign: TextAlign.center,
                  color: AppColors.lightoff_white,
                  fontSize: 16,
                ),
                SizedBox(height: 30),
                BuildElivatedButtonWidget(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavScreen(),));
                  },
                  textSize: 20,
                  width: screenWidth / 1.3,
                  height: 60,
                  color: AppColors.button_color,
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
