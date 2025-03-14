import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';

class BuildButtomNavWidget extends StatefulWidget {
  final int initialIndex;
  final ValueChanged<int> onItemSelected;

  const BuildButtomNavWidget({
    Key? key,
    required this.initialIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  _BuildBottomNavWidgetState createState() => _BuildBottomNavWidgetState();
}

class _BuildBottomNavWidgetState extends State<BuildButtomNavWidget> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
      widget.onItemSelected(index);
    }
  }

  Widget _buildSvgIcon(String assetName, Color color) {
    return SvgPicture.asset(
      assetName,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 108,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: AppColors.black_light,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.white,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.red,
            unselectedItemColor: AppColors.black,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: _buildSvgIcon('assets/images/icons/home 1.svg', _selectedIndex == 0 ? AppColors.red : AppColors.black),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: _buildSvgIcon('assets/images/icons/heart_icon .svg', _selectedIndex == 1 ? AppColors.red : AppColors.black),
                label: "Wishlist",
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: _buildSvgIcon('assets/images/icons/search_icon.svg', _selectedIndex == 3 ? AppColors.red : AppColors.black),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: _buildSvgIcon('assets/images/icons/settings_icon.svg', _selectedIndex == 4 ? AppColors.red : AppColors.black),
                label: "Settings",
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 50,
          child: FloatingActionButton(
            onPressed: () => _onItemTapped(2),
            backgroundColor: AppColors.white,
            elevation: 10,
            shape: CircleBorder(),
            child: _buildSvgIcon('assets/images/icons/cart_icon.svg', AppColors.black),
          ),
        ),
      ],
    );
  }
}
