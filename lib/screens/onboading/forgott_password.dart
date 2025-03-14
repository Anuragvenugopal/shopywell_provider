import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../utils/app_colors.dart';
import '../../widgets/build_elivated_button_widget.dart';
import '../../widgets/build_text_feild_widget.dart';
import '../../widgets/build_text_widget.dart';
import '../../widgets/terms_text_widget.dart';

class ForgottPassword extends StatefulWidget {
  @override
  State<ForgottPassword> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgottPassword> {
  final TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.sendPasswordResetEmail(email: emailController.text.trim());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password reset email sent! Check your inbox.")),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
    }
  }

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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: BuildTextWidget(
                      text: "  Forgot \n  password?",
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TermsTextWidget(
                      highlightedText: '*',
                      textAfter: " We will send you a message to set or reset your new password.",
                      textColor: AppColors.black_light,
                      highlightedColor: AppColors.red,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  BuildElivatedButtonWidget(
                    text: "Submit",
                    onPressed: _resetPassword,
                    color: AppColors.button_color,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
