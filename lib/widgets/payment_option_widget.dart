import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';


class PaymentOptionWidget extends StatefulWidget {
  final int index;
  final int selectedIndex;
  final String logoPath;
  final String cardNumber;
  final Function(int) onSelect;

  const PaymentOptionWidget({
    Key? key,
    required this.index,
    required this.selectedIndex,
    required this.logoPath,
    required this.cardNumber,
    required this.onSelect,
  }) : super(key: key);

  @override
  _PaymentOptionWidgetState createState() => _PaymentOptionWidgetState();
}

class _PaymentOptionWidgetState extends State<PaymentOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelect(widget.index);
      },
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.selectedIndex == widget.index ? AppColors.red : Colors.grey.shade300,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
          color: widget.selectedIndex == widget.index ? AppColors.red.withOpacity(0.1) : Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Image.asset(widget.logoPath, width: 40, height: 40),
            Spacer(),
            Text(widget.cardNumber, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
