import 'package:flutter/material.dart';

class BuildTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final Color? underlineColor;

  const BuildTextWidget({
    Key? key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black54,
    this.textAlign = TextAlign.center,
    this.maxLines,
    this.overflow,
    this.textDecoration,
    this.underlineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        decoration: textDecoration ?? TextDecoration.none,
        decorationColor: underlineColor ?? color,
      ),
    );
  }
}
