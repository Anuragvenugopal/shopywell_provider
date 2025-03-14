import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/build_elivated_button_widget.dart';
import '../../widgets/build_text_feild_widget.dart';
import '../../widgets/build_text_widget.dart';
import '../../widgets/social_meadia_icon_widget.dart';
import '../get_started_page.dart';
import 'create_an_account_page.dart';
import 'forgott_password.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

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
                    text: "Welcome\nBack!",
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                BuildTextFeildWidget(
                  controller: emailController,
                  hintText: "Username or Email",
                  prefixIcon: Icons.person_outline,
                ),
                SizedBox(height: screenHeight * 0.04),
                BuildTextFeildWidget(
                  controller: passwordController,
                  hintText: "Password",
                  prefixIcon: Icons.lock_outline,
                  obscureText: !isPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgottPassword(),
                          ));
                    },
                    child: BuildTextWidget(
                      text: "Forgot Password?",
                      color: AppColors.red,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                BuildElivatedButtonWidget(
                  text: "Login",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GetStartedPage(),
                        ));
                  },
                  color: AppColors.button_color,
                ),
                SizedBox(height: screenHeight * 0.09),
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
                      text: "Create An Account",
                      fontSize: screenWidth * 0.04,
                      color: AppColors.black_light,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAnAccountPage(),
                            ));
                      },
                      child: BuildTextWidget(
                        text: "Sign Up",
                        fontSize: screenWidth * 0.04,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
