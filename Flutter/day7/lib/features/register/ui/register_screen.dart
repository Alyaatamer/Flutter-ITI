import 'package:day7/core/style/app_color.dart';
import 'package:day7/core/widgets/custom_button.dart';
import 'package:day7/core/widgets/custom_text_field.dart';
import 'package:day7/features/login/ui/login_screen.dart';
import 'package:day7/features/register/logic/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterProvider(),
      builder: (context, child) {
        final provider = context.read<RegisterProvider>();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: provider.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 14,
                          children: [
                            Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.bodyColor,
                              ),
                            ),
                            CustomTextField(
                              controller: provider.nameController,
                              hintText: 'Full Name',
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter full name';
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              controller: provider.emailController,
                              hintText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email address';
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              controller: provider.phoneController,
                              hintText: 'Phone',
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter phone number';
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              controller: provider.passwordController,
                              hintText: 'Password',
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              controller: provider.confirmPasswordController,
                              hintText: 'Confirm Password',
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter confirm password';
                                } else if (value !=
                                    provider.passwordController.text) {
                                  return 'Passwords don\'t match';
                                }
                                return null;
                              },
                            ),
                            Consumer<RegisterProvider>(
                              builder: (context, provider, child) {
                                if (provider.isLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return CustomButton(
                                  onPressed: () {
                                    provider.submit(context);
                                  },
                                  text: 'Create Account',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account yet?',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.text100Color,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text('Sign In'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
