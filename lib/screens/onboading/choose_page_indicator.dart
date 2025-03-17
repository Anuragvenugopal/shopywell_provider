import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopywelll/utils/app_colors.dart';
import '../../provider/choose_page_provider.dart';
import '../../widgets/build_text_widget.dart';
import '../get_started_page.dart';
import 'choose_products_page.dart';
import 'make_payment_page.dart';
import 'get_your_order_page.dart';

class ChoosePageIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<ChoosePageProvider>(context);

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
                controller: pageProvider.pageController,
                onPageChanged: (index) => pageProvider.onPageChanged(index),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (pageProvider.currentPage > 0)
                    TextButton(
                      onPressed: pageProvider.prevPage,
                      child: BuildTextWidget(
                        text: "Prev",
                        fontSize: 15,
                        color: AppColors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  else
                    SizedBox(width: 60),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(3, (index) {
                      bool isActive = pageProvider.currentPage == index;
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
                  TextButton(
                    onPressed: () => pageProvider.nextPage(context),
                    child: BuildTextWidget(
                      text: pageProvider.currentPage == 2 ? "Get Started" : "Next",
                      fontSize: 15,
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
