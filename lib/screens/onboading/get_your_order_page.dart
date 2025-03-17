import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../provider/choose_page_provider.dart';
import '../../utils/app_colors.dart';
import '../../widgets/build_text_widget.dart';

class GetYourOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Consumer<ChoosePageProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight / 10),
              SvgPicture.asset(
                "assets/images/svgs/image3.svg",
                width: screenWidth,
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => provider.nextPage(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
