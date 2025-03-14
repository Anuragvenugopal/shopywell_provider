import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SizeSelectorWidget extends StatefulWidget {
  final List<int> sizes;
  final Function(int) onSizeSelected;

  const SizeSelectorWidget({
    Key? key,
    required this.sizes,
    required this.onSizeSelected,
  }) : super(key: key);

  @override
  _SizeSelectorWidgetState createState() => _SizeSelectorWidgetState();
}

class _SizeSelectorWidgetState extends State<SizeSelectorWidget> {
  int _selectedSize = 7; // Default selected size

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Text("Size: $_selectedSize UK",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            Row(
              children: widget.sizes.map((size) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedSize = size;
                    });
                    widget.onSizeSelected(size);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: _selectedSize == size ? AppColors.pink : AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.pink,width: 1.5),
                    ),
                    child: Text(
                      "$size UK",
                      style: TextStyle(
                        color: _selectedSize == size ? Colors.white : AppColors.pink,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
