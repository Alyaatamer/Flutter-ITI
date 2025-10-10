import 'package:day9/features/register/logic/register_provider.dart';
import 'package:day9/features/register/ui/widget/register_form.dart';
import 'package:day9/features/register/ui/widget/register_submit.dart';
import 'package:day9/features/register/ui/widget/regitser_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  RegisterHeader(),
                  SizedBox(height: 50),
                  RegisterForm(),
                  SizedBox(height: 16),
                  RegisterSubmit(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
