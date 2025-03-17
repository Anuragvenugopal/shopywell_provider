import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/bottom_nav_provider.dart';
import '../screens/home_page.dart';
import '../screens/wishlist_page.dart';
import '../screens/cart_page.dart';
import '../screens/search_page.dart';
import '../screens/onboading/settings_page.dart';
import '../widgets/build_buttom_nav_widget.dart';
class BottomNavScreen extends StatelessWidget {
  final List<Widget> _pages = [
    HomePage(),
    WishlistPage(),
    CartPage(),
    SearchPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      body: _pages[bottomNavProvider.selectedIndex],
      bottomNavigationBar: BuildButtomNavWidget(
        initialIndex: bottomNavProvider.selectedIndex,
        onItemSelected: (index) {
          bottomNavProvider.setIndex(index);
        },
      ),
    );
  }
}
