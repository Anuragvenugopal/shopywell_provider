import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../utils/app_colors.dart';
import '../../widgets/build_elivated_button_widget.dart';
import '../../widgets/build_text_feild_widget.dart';
import '../../widgets/build_text_widget.dart';
import '../../widgets/social_meadia_icon_widget.dart';
import '../../widgets/terms_text_widget.dart';

class CreateAnAccountPage extends StatefulWidget {
  @override
  State<CreateAnAccountPage> createState() => _CreateAnAccountPageState();
}

class _CreateAnAccountPageState extends State<CreateAnAccountPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void _createAccount() async {
    if (_formKey.currentState!.validate()) {
      try {
        String email = emailController.text.trim();
        String password = passwordController.text.trim();

        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (userCredential.user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Account created successfully!")),
          );
          Navigator.pop(context);
        }
      } on FirebaseAuthException catch (e) {
        String message = "An error occurred.";
        if (e.code == 'email-already-in-use') {
          message = "This email is already in use.";
        } else if (e.code == 'weak-password') {
          message = "Password must be at least 6 characters.";
        } else if (e.code == 'invalid-email') {
          message = "Invalid email format.";
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $message")),
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
                      text: "  Create an \n account",
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  BuildTextFeildWidget(
                    controller: emailController,
                    hintText: "Username or Email",
                    prefixIcon: Icons.person_outline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return "Enter a valid email address";
                      }
                      return null;
                    },

                  ),
                  SizedBox(height: screenHeight * 0.04),
                  BuildTextFeildWidget(
                    controller: passwordController,
                    hintText: "Password",
                    prefixIcon: Icons.lock_outline,
                    obscureText: !isPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  BuildTextFeildWidget(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    prefixIcon: Icons.lock_outline,
                    obscureText: !isConfirmPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please confirm your password";
                      } else if (value != passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TermsTextWidget(
                      textBefore: "By clicking the ",
                      highlightedText: "Register",
                      textAfter: " button, you agree to the public offer",
                      textColor: AppColors.black_light,
                      highlightedColor: AppColors.red,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  BuildElivatedButtonWidget(
                    text: "Create Account",
                    onPressed: _createAccount,
                    color: AppColors.button_color,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  BuildTextWidget(
                    text: "- OR Continue with -",
                    fontSize: screenWidth * 0.04,
                    color: AppColors.black_light,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  SocialMeadiaIconWidget(),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BuildTextWidget(
                        text: "I Already Have an Account",
                        fontSize: screenWidth * 0.04,
                        color: AppColors.black_light,
                        fontWeight: FontWeight.w400,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: BuildTextWidget(
                          text: "Login",
                          fontSize: screenWidth * 0.04,
                          color: AppColors.red,
                          fontWeight: FontWeight.bold,
                          textDecoration: TextDecoration.underline,
                          underlineColor: AppColors.red,
                        ),
                      ),
                    ],
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
