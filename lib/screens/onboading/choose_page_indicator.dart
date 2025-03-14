import 'package:flutter/material.dart';
import 'package:shopywelll/screens/onboading/sign_in_page.dart';

import '../../utils/app_colors.dart';
import '../get_started_page.dart';
import 'choose_products_page.dart';
import 'make_payment_page.dart';
import 'get_your_order_page.dart';
import '../../widgets/build_text_widget.dart';

class ChoosePageIndicator extends StatefulWidget {
  @override
  _ChoosePageIndicatorPageState createState() => _ChoosePageIndicatorPageState();
}

class _ChoosePageIndicatorPageState extends State<ChoosePageIndicator> {
  final PageController pageController = PageController();
  int currentPage = 0;

  void nextPage() {
    if (currentPage < 2) {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => GetStartedPage()),
                      );
                    },
                    child: BuildTextWidget(text: "Skip", color: AppColors.black),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: [
                  ChooseProductsPage(),
                  MakePaymentPage(),
                  GetYourOrderPage(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(3, (index) {
                          bool isActive = currentPage == index;
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: isActive ? 40 : 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: isActive ? AppColors.black : AppColors.black_light,
                              borderRadius: BorderRadius.circular(isActive ? 5 : 50),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: nextPage,
                    child: BuildTextWidget(
                      text: "Next",
                      fontSize: 16,
                      color: AppColors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
