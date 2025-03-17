import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isLoading = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  Future<void> signIn(BuildContext context, VoidCallback onSuccess) async {
    if (!formKey.currentState!.validate()) return;
    isLoading = true;
    notifyListeners();
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Login failed")),
      );
    }
    isLoading = false;
    notifyListeners();
  }
}
