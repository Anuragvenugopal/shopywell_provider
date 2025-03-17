import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isLoading = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  Future<void> createAccount(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    notifyListeners();

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

    isLoading = false;
    notifyListeners();
  }
}
