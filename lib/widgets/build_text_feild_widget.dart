import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BuildTextFeildWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final Color? fillColor;
  final String? Function(String?)? validator;

  const BuildTextFeildWidget({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.fillColor,
    this.validator,
  });

  @override
  State<BuildTextFeildWidget> createState() => _BuildTextFieldWidgetState();
}

class _BuildTextFieldWidgetState extends State<BuildTextFeildWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.07,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: screenWidth * 0.04),
          filled: true,
          fillColor: widget.fillColor ?? Colors.grey[200],
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, color: AppColors.grey_light, size: screenWidth * 0.06 )
              : null,
          suffixIcon: widget.suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            borderSide: BorderSide(color: AppColors.grey, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            borderSide: BorderSide(color: AppColors.grey, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            borderSide: BorderSide(color: AppColors.red, width: 2),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}