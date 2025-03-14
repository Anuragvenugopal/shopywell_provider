import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import '../screens/wishlist_page.dart';
import '../screens/cart_page.dart';
import '../screens/search_page.dart';

import '../widgets/build_buttom_nav_widget.dart';
import 'onboading/settings_page.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    WishlistPage(),
    CartPage(),
    SearchPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BuildButtomNavWidget(
        initialIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
