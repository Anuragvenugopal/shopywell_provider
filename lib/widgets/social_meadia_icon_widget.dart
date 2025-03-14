import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopywelll/screens/get_started_page.dart';

import '../screens/bottom_nav_screen.dart';
import '../utils/app_colors.dart';


class SocialMeadiaIconWidget extends StatefulWidget {
  const SocialMeadiaIconWidget({super.key});

  @override
  State<SocialMeadiaIconWidget> createState() => _SocialMediaIconWidgetState();
}

class _SocialMediaIconWidgetState extends State<SocialMeadiaIconWidget> {
  bool _isLoading = false;

  Future<void> signInWithGoogle() async {
    setState(() => _isLoading = true);

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        print("User canceled Google sign-in.");
        setState(() => _isLoading = false);
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      print("Google Sign-In successful");

      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => GetStartedPage()),
              (route) => false,
        );
      }
    } catch (e) {
      print('Google Sign-In failed: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.16;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSocialButton("assets/images/icons/google.svg", iconSize, () {
          if (!_isLoading) signInWithGoogle();
        }),
        SizedBox(width: screenWidth * 0.05),
        buildSocialButton("assets/images/icons/apple.svg", iconSize, () {
          print("Apple Clicked");
        }),
        SizedBox(width: screenWidth * 0.05),
        buildSocialButton("assets/images/icons/facebook.svg", iconSize, () {
          print("Facebook Clicked");
        }),
      ],
    );
  }

  Widget buildSocialButton(String assetName, double size, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.all(size * 0.2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.red, width: 2),
          color: _isLoading && assetName.contains("google")
              ? AppColors.grey
              : AppColors.light_red,
        ),
        child: Center(
          child: _isLoading && assetName.contains("google")
              ? CircularProgressIndicator(color: AppColors.red)
              : SvgPicture.asset(assetName, fit: BoxFit.contain),
        ),
      ),
    );
  }
}