import 'package:flutter/material.dart';

import '../screens/onboading/sign_in_page.dart';


class ChoosePageProvider with ChangeNotifier {
  final PageController pageController = PageController();
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void nextPage(BuildContext context) {
    if (_currentPage < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      // Navigate using MaterialPageRoute
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
      );
    }
    _updatePage();
  }

  void prevPage() {
    if (_currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
    _updatePage();
  }

  void onPageChanged(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void _updatePage() {
    _currentPage = pageController.page?.round() ?? 0;
    notifyListeners();
  }
}
