import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'build_text_widget.dart';


class CustomDropDownFeild extends StatefulWidget {
  final String label;
  final List<String> items;
  final String initialValue;
  final ValueChanged<String> onChanged;

  const CustomDropDownFeild({
    Key? key,
    required this.label,
    required this.items,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownFieldState createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropDownFeild> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildTextWidget(
          text: widget.label,
          fontSize: 14,
          color: Colors.black,
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(8),

          ),
          child: DropdownButton<String>(
            dropdownColor: AppColors.white,
            value: selectedValue,
            isExpanded: true,
            underline: SizedBox(),
            items: widget.items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedValue = newValue;
                });
                widget.onChanged(newValue);
              }
            },
          ),
        ),
      ],
    );
  }
}
