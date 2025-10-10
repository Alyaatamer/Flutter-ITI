import 'package:day9/core/widgets/custom_text_field.dart';
import 'package:day9/features/login/logic/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginFrom extends StatelessWidget {
  const LoginFrom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LoginProvider>();
    return Form(
      key: provider.formKey,
      child: Column(
        spacing: 16,
        children: [
          CustomTextField(
            controller: provider.emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter email address';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: provider.passwordController,
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              }
              return null;
            },
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
