import 'package:day9/core/widgets/custom_button.dart';
import 'package:day9/features/register/logic/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterSubmit extends StatelessWidget {
  const RegisterSubmit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return CustomButton(
          onPressed: () {
            provider.register(context);
          },
          text: 'Create Account',
        );
      },
    );
  }
}
