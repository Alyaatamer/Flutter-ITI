import 'dart:developer';
import 'package:day7/core/local_storage/shared_preferences_helper.dart';
import 'package:day7/core/networking/api_constants.dart';
import 'package:day7/core/networking/dio_factory.dart';
import 'package:day7/features/home/ui/home_screen.dart';
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
        final response = await DioFactory.postData(
          ApiConstants.login,
          data: {
            'email': emailController.text,
            'password': passwordController.text,
          },
        );
        final token = response.data['data']['token'];
        await SharedPreferencesHelper.setString('token', token);
        isLoading = false;
        notifyListeners();
        Fluttertoast.showToast(msg: 'You are logged in successfully');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false,
        );
      } catch (e) {
        isLoading = false;
        notifyListeners();
        log(e.toString());
        Fluttertoast.showToast(msg: 'Credentials don\'t correct');
      }
    }
  }
}
