import 'package:day9/core/widgets/custom_button.dart';
import 'package:day9/features/login/logic/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginSubmit extends StatelessWidget {
  const LoginSubmit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return CustomButton(
          onPressed: () {
            provider.login(context);
          },
          text: 'Login',
        );
      },
    );
  }
}
