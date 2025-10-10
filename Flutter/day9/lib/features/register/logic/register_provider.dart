import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day9/features/conversations/ui/conversations_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final nameController = TextEditingController();
  bool isLoading = false;
  void register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        // Save data in db
        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set({
              'email': emailController.text,
              'uid': credential.user!.uid,
              'phone': phoneController.text,
              'age': ageController.text,
              'name': nameController.text,
            });
        Fluttertoast.showToast(msg: 'You are registered successfully');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ConversationsScreen()),
          (route) => false,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Fluttertoast.showToast(msg: 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Fluttertoast.showToast(
            msg: 'The account already exists for that email.',
          );
        } else if (e.code == 'invalid-email') {
          Fluttertoast.showToast(msg: 'Please enter valid emaill');
        }
      }
      isLoading = false;
      notifyListeners();
    }
  }
}
