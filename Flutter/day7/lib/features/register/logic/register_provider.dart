import 'package:day7/core/networking/api_constants.dart';
import 'package:day7/core/networking/dio_factory.dart';
import 'package:day7/features/home/ui/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isLoading = false;
    void submit(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();

      try {
        final response = await DioFactory.postData(
          ApiConstants.register,
          data: {
            'name': nameController.text,
            'email': emailController.text,
            'phone': phoneController.text,
            'gender': 0,
            'password': passwordController.text,
            'password_confirmation': confirmPasswordController.text,
          },
        );

        print("Response is ${response.data}");

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false,
        );
      } on DioException catch (e) {
        if (e.response != null && e.response?.data != null) {
          final errorData = e.response?.data;

          // show only the error message if available
          String message = "An error occurred";
          if (errorData is Map && errorData["data"] != null) {
            final data = errorData["data"] as Map;
            if (data.isNotEmpty) {
              final firstKey = data.keys.first;
              final firstError = data[firstKey];
              if (firstError is List && firstError.isNotEmpty) {
                message = firstError.first.toString();
              }
            }
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Connection error, please try again")),
          );
        }
      } finally {
        isLoading = false;
        notifyListeners();
      }
    }
  }
}
