import 'package:day9/features/conversations/ui/conversations_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  void login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Fluttertoast.showToast(msg: 'You are logged in successfully');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ConversationsScreen()),
          (route) => false,
        );
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'invalid-email':
          case 'invalid-credential':
            Fluttertoast.showToast(msg: 'The credentials aren\'t correct');
          case 'user-disabled':
            Fluttertoast.showToast(msg: 'You are disabled');
        }
      }
      isLoading = false;
      notifyListeners();
    }
  }
}
