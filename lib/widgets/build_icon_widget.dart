import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildIconWidget extends StatefulWidget {
  final String assetName;

  const BuildIconWidget({super.key, required this.assetName});

  @override
  State<BuildIconWidget> createState() => _SocialIconWidgetState();
}

class _SocialIconWidgetState extends State<BuildIconWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Implement social login
      },
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        child: SvgPicture.asset(widget.assetName, width: 30),
      ),
    );
  }
}
