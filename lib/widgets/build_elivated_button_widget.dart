import 'package:flutter/material.dart';

class BuildElivatedButtonWidget extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double? width;
  final double? height;
  final double? textSize;

  const BuildElivatedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.width,
    this.height,
    this.textSize,
  });

  @override
  State<BuildElivatedButtonWidget> createState() => _BuildElevatedButtonWidgetState();
}

class _BuildElevatedButtonWidgetState extends State<BuildElivatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: widget.width ?? screenWidth * 0.9,
      height: widget.height ?? screenHeight * 0.07,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular((widget.width ?? screenWidth * 0.9) * 0.02),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.textSize ?? (widget.width ?? screenWidth * 0.9) * 0.045,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}