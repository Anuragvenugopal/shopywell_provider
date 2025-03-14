import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/build_text_widget.dart';

class MakePaymentPage extends StatefulWidget {
  const MakePaymentPage({super.key});

  @override
  State<MakePaymentPage> createState() => _MakePaymentPageState();
}

class _MakePaymentPageState extends State<MakePaymentPage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height:screenHeight/8,),
          SvgPicture.asset(
            "assets/images/svgs/image2.svg",
            width: screenWidth,
          ),
          SizedBox(height: 20),
          BuildTextWidget(
            text: "Make Payment",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BuildTextWidget(
              text: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit..",
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
