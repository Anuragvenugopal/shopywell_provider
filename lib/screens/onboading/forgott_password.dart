import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/build_elivated_button_widget.dart';
import '../../widgets/build_text_feild_widget.dart';
import '../../widgets/build_text_widget.dart';
import '../../widgets/terms_text_widget.dart';

class ForgottPassword extends StatefulWidget {
  @override
  State<ForgottPassword> createState() => _ForgottPasswordPageState();
}

class _ForgottPasswordPageState extends State<ForgottPassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.05),
                Align(
                  alignment: Alignment.centerLeft,
                  child: BuildTextWidget(
                    text:  "  Forgot \n  password?",
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                BuildTextFeildWidget(
                  controller: emailController,
                  hintText: "Enter your email address",
                  prefixIcon: Icons.email,
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TermsTextWidget(
                    highlightedText: '*',
                    textAfter:
                    " We will send you a message to set or reset your new password ",
                    textColor: AppColors.black_light,
                    highlightedColor: AppColors.red,
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                BuildElivatedButtonWidget(
                  text: "Submit",
                  onPressed: () {},
                  color: AppColors.button_color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
