import 'package:flutter/material.dart';

class TermsTextWidget extends StatefulWidget {
  final String? textBefore;
  final String?highlightedText;
  final String?textAfter;
  final Color textColor;
  final Color highlightedColor;

  const TermsTextWidget({
    super.key,
     this.textBefore,
     this.highlightedText,
     this.textAfter,
    this.textColor = Colors.black54,
    this.highlightedColor = Colors.red,
  });

  @override
  State<TermsTextWidget> createState() => _TermsTextWidgetState();
}

class _TermsTextWidgetState extends State<TermsTextWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: screenWidth * 0.04, color: widget.textColor),
          children: [
            TextSpan(text: widget.textBefore),
            TextSpan(
              text: widget.highlightedText,
              style: TextStyle(color: widget.highlightedColor, fontWeight: FontWeight.w600,fontSize: 12),
            ),
            TextSpan(text: widget.textAfter),
          ],
        ),
      ),
    );
  }
}
